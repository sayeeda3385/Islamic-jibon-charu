-- ইসলামিক জীবন — চারু: নিরাপদ নির্মাতা প্রোফাইল
-- 1) Supabase Dashboard > Authentication > Users থেকে আগে অ্যাডমিন ইউজার তৈরি করুন।
-- 2) নিচের SELECT চালিয়ে সেই ইউজারের UUID কপি করুন।
-- 3) INSERT-এর REPLACE_WITH_ADMIN_USER_UUID-তে UUID বসিয়ে পুরো SQL চালান।
-- 4) Auth settings-এ public sign-ups বন্ধ রাখুন। service_role key কখনো frontend/GitHub-এ দেবেন না।

create table if not exists public.creator_profile (
  id integer primary key default 1 check (id = 1),
  owner_uid uuid not null references auth.users(id) on delete restrict,
  name text not null default '',
  email text not null default '',
  phone text not null default '',
  website text not null default '',
  facebook text not null default '',
  youtube text not null default '',
  address text not null default '',
  message text not null default '',
  photo_url text not null default '',
  updated_at timestamptz not null default now()
);

alter table public.creator_profile enable row level security;

drop policy if exists "Public can read creator profile" on public.creator_profile;
create policy "Public can read creator profile"
on public.creator_profile for select to anon, authenticated
using (true);

drop policy if exists "Only profile owner can update creator profile" on public.creator_profile;
create policy "Only profile owner can update creator profile"
on public.creator_profile for update to authenticated
using (auth.uid() = owner_uid)
with check (auth.uid() = owner_uid);

-- No INSERT or DELETE policy is intentionally provided.
-- Seed exactly one row as the project owner using the Auth user's UUID:
-- select id, email from auth.users;
insert into public.creator_profile (id, owner_uid)
-- Replace the placeholder with the UUID of the owner account created in Supabase Auth.
-- Never reuse an unrelated UUID from another project.
values (1, 'REPLACE_WITH_ADMIN_USER_UUID'::uuid)
on conflict (id) do nothing;

-- Publicly viewable profile photo bucket. Only the profile owner may write.
insert into storage.buckets (id, name, public, file_size_limit, allowed_mime_types)
values ('creator-assets', 'creator-assets', true, 3145728, array['image/jpeg','image/png','image/webp'])
on conflict (id) do update set public = true, file_size_limit = 3145728,
  allowed_mime_types = array['image/jpeg','image/png','image/webp'];

drop policy if exists "Public can view creator assets" on storage.objects;
create policy "Public can view creator assets"
on storage.objects for select to anon, authenticated
using (bucket_id = 'creator-assets');

drop policy if exists "Only creator profile owner can upload assets" on storage.objects;
create policy "Only creator profile owner can upload assets"
on storage.objects for insert to authenticated
with check (
  bucket_id = 'creator-assets'
  and exists (select 1 from public.creator_profile p where p.owner_uid = auth.uid())
);

drop policy if exists "Only creator profile owner can update assets" on storage.objects;
create policy "Only creator profile owner can update assets"
on storage.objects for update to authenticated
using (
  bucket_id = 'creator-assets'
  and exists (select 1 from public.creator_profile p where p.owner_uid = auth.uid())
)
with check (
  bucket_id = 'creator-assets'
  and exists (select 1 from public.creator_profile p where p.owner_uid = auth.uid())
);

drop policy if exists "Only creator profile owner can delete assets" on storage.objects;
create policy "Only creator profile owner can delete assets"
on storage.objects for delete to authenticated
using (
  bucket_id = 'creator-assets'
  and exists (select 1 from public.creator_profile p where p.owner_uid = auth.uid())
);
