
if defined? Lesli
    Lesli.configure do |config|
        config.demo = true
        config.security[:allow_multiaccount] = false
        config.audit[:cloudflare] = {
            enabled: ENV.fetch("CLOUDFLARE_TRAFFIC_ENABLED", "false"),
            zone_id: ENV["CLOUDFLARE_ANALYTICS_ZONE_ID"],
            hostnames: ENV.fetch("CLOUDFLARE_ANALYTICS_HOSTNAMES", "").split(","),
            account_ids: ENV.fetch("CLOUDFLARE_TRAFFIC_ACCOUNT_IDS", "").split(","),
            page_size: ENV.fetch("CLOUDFLARE_ANALYTICS_PAGE_SIZE", 1_000),
            max_pages: ENV.fetch("CLOUDFLARE_ANALYTICS_MAX_PAGES", 100),
            backfill_days: ENV.fetch("CLOUDFLARE_TRAFFIC_BACKFILL_DAYS", 30),
            reimport_days: ENV.fetch("CLOUDFLARE_TRAFFIC_REIMPORT_DAYS", 3),

            # The host decides which application record owns each public path.
            # Returning nil ignores paths that are not tracked by LesliAudit.
            resource_resolver: ->(account:, hostname:, path:) { nil }
        }
    end
end
