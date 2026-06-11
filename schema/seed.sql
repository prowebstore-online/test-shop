-- Seed data for test-shop (ecommerce template)
-- This file is run once at setup. Add your initial content here.
-- The AI agent can also seed data via chat.

INSERT OR IGNORE INTO site_meta (key, value) VALUES
  ('config', '{"title":"test-shop","description":"Built with ProWebStore"}'),
  ('theme', '{"colors":{"primary":"#1e3a5f","accent":"#c49b3c","background":"#faf9f7","text":"#2d3748"},"fonts":{"heading":"Fraunces, Georgia, serif","body":"Manrope, system-ui, sans-serif"},"radius":"md","shadow":"sm","spacing":"relaxed"}'),
  ('nav', '{"logo_text":"test-shop","style":"standard"}'),
  ('footer', '{"copyright":"2026 test-shop"}');
