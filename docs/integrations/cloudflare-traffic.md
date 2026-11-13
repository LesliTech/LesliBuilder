# Cloudflare Traffic in LesliBuilder

LesliAudit owns the standard Cloudflare Traffic implementation. LesliBuilder
does not define a second client, converter, job, model, or migration. This host
only supplies deployment-specific configuration and runs the engine job on a
schedule.

The engine flow is intentionally small:

```text
Cloudflare GraphQL POST
  -> LesliAudit::Cloudflare::SnapshotConverter
  -> LesliAudit::TrafficSnapshotImporter
  -> LesliAudit Traffic dashboard
```

See the complete metric and privacy contract in
`engines/LesliAudit/docs/traffic/cloudflare.md`.

## Credentials

Create a Cloudflare API token with analytics read access for the required zone.
Store it in encrypted Rails credentials:

```yaml
cloudflare:
  analytics:
    token: your-token
```

The deployment may instead provide `CLOUDFLARE_ANALYTICS_TOKEN`. Never commit
the token or store it in a LesliAudit table.

For the reference Kamal deployment, copy `.env.kamal.example` to the ignored
`.env.kamal` file and set the Cloudflare values there. `config/deploy.yml`
passes them to the application as deployment secrets.

## Host Configuration

LesliBuilder configures the engine in `config/initializers/lesli.rb`:

```ruby
config.audit[:cloudflare] = {
  enabled: ENV.fetch("CLOUDFLARE_TRAFFIC_ENABLED", "false"),
  zone_id: ENV["CLOUDFLARE_ANALYTICS_ZONE_ID"],
  hostnames: ENV.fetch("CLOUDFLARE_ANALYTICS_HOSTNAMES", "").split(","),
  account_ids: ENV.fetch("CLOUDFLARE_TRAFFIC_ACCOUNT_IDS", "").split(","),
  page_size: ENV.fetch("CLOUDFLARE_ANALYTICS_PAGE_SIZE", 1_000),
  max_pages: ENV.fetch("CLOUDFLARE_ANALYTICS_MAX_PAGES", 100),
  backfill_days: ENV.fetch("CLOUDFLARE_TRAFFIC_BACKFILL_DAYS", 30),
  reimport_days: ENV.fetch("CLOUDFLARE_TRAFFIC_REIMPORT_DAYS", 3),
  resource_resolver: ->(account:, hostname:, path:) {
    # Return a tracked resource or nil to ignore the path.
    # { resource_type: "Profile", resource_id: 27 }
  }
}
```

The resolver remains in the host because only the host understands its route
and model structure. Query strings and fragments are removed before the
resolver is called.

## Synchronization

LesliAudit provides both tasks:

```shell
# Reimport the configured recent days for all configured accounts.
bin/rails cloudflare_traffic:sync

# Import 30 complete days for Lesli::Account ID 1.
bin/rails "cloudflare_traffic:backfill[1,30]"
```

The production schedule in `config/recurring.yml` calls:

```ruby
LesliAudit::CloudflareTrafficSyncJob.enqueue_recent
```

The job stores operational state in
`lesli_audit_cloudflare_traffic_syncs`. Traffic totals and dimensions remain
in `lesli_audit_traffic_rollups` and
`lesli_audit_traffic_breakdowns`.

## Troubleshooting

| Symptom | Check |
| --- | --- |
| No Traffic data | Enable the integration, configure account IDs and hostnames, and ensure the resolver returns a resource for the requested path. |
| Authentication failure | Verify the token, analytics read permission, and zone restriction. |
| Stale warning | Inspect the latest `lesli_audit_cloudflare_traffic_syncs.error_message`, the queue worker, and the recurring schedule. |
| Missing path | Confirm the hostname and resolver mapping. Paths returning `nil` are intentionally ignored. |
| Page limit error | Check Cloudflare dataset limits before raising `max_pages`. Partial results are not stored. |

Traffic is aggregate, external, and eventually consistent. It is not audit
evidence and must not be used to prove a user action or business transaction.
