# Supabase setup — Islamic Jibon Charu

This repository uses GitHub Pages for the static app and Supabase Auth, Postgres and Storage for the creator profile editor.

## Security model
- Visitors can read the single public creator profile.
- Only the pre-created Supabase Auth user whose UUID is stored as `owner_uid` can update it or upload/delete profile images.
- The admin page has sign-in only; it does not offer public sign-up.
- There is intentionally no public INSERT or DELETE policy for the profile row.
- Only the Supabase publishable/anon key belongs in the browser. Never expose a `service_role` key.

## One-time project setup
1. Create a Supabase project using the free tier.
2. In **Authentication → Users**, create the owner's account manually. Do not add a sign-up form to the public app. Disable public sign-ups in Auth settings after creating the owner.
3. In the SQL editor, run `select id, email from auth.users;` and copy the owner's UUID.
4. Open `supabase-setup.sql`, replace `REPLACE_WITH_ADMIN_USER_UUID` with that UUID, and run the SQL.
5. In Supabase **Project Settings → API**, copy the Project URL and publishable/anon key.
6. Edit `supabase-config.js` in GitHub and set `url` and `anonKey`. The anon/publishable key is designed to be public; RLS policies protect the data. Never paste a service_role/secret key into this file.
7. Publish the GitHub Pages site. Open `/admin.html`, sign in with the owner account, and edit the profile.

## Files
- `admin.html`: owner-only sign-in and creator profile editor.
- `supabase-config.js`: public project URL and anon/publishable key placeholders.
- `supabase-setup.sql`: database, row-level security and image storage policies.
- `creator-profile.js`: public read-only profile loader for the app contact page.

## Limits
Supabase Free has quotas and may pause inactive projects. Keep a separate backup of profile information and verify the project's current limits before relying on it for production.
