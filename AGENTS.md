# Shared interface conventions

When creating or modifying a page-level navigation sidebar, follow
[gems/LesliView/docs/layout/navigation_sidebar.md](gems/LesliView/docs/layout/navigation_sidebar.md).
This is the standard used by Babel and Shield: a 240 px sticky sidebar on
desktop, native disclosure navigation on mobile, and flexible page content.
Preserve accessible navigation, I18n labels, URL filters, and Turbo behavior.

Use existing LesliView components for page containers, headers, and action
buttons. Prefer readable, explicit code and shared presentation partials over
copying layouts between views. Use `LesliView::Layout::NavigationSidebar` for this pattern; engines prepare
items and routes instead of duplicating its responsive HTML.
