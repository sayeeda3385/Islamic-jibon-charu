# ইসলামিক জীবন — চারু | Islamic Life — Charu

বাংলা ও English-এ ইসলামি শিক্ষার একটি Progressive Web App (PWA)। এটি শিক্ষামূলক সহায়িকা; ব্যক্তিগত ফতোয়া বা যোগ্য আলেমের বিকল্প নয়।

## বর্তমান বৈশিষ্ট্য
- বাংলা / English ইন্টারফেস
- আল-কুরআনের ১১৪ সূরার তালিকা এবং ৩০ পারার পাঠক; আরবি পাঠ, বাংলা ও English অনুবাদ, আয়াতভিত্তিক আল-আফাসি অডিও ও বুকমার্ক (ইন্টারনেট-নির্ভর)
- নির্বাচিত হাদিস সংকলনের অনলাইন পাঠক; উপলভ্য ডেটা ও অনুবাদ সংস্করণভেদে ভিন্ন হতে পারে
- দৈনন্দিন দোয়া ও যিকির; হানাফি পদ্ধতিতে নামাজ ও পবিত্রতার বিস্তৃত বাংলা/English পাঠ (অজু, গোসল, তায়াম্মুম, হায়েজ-নিফাস, নামাজের শর্ত-ফরজ-ওয়াজিব, ধাপে ধাপে আদায়, বিতর, জামাত, সাহু সিজদা, কাজা, সফর, অসুস্থতা, জুমা, ঈদ ও যিকির)।
- কুরআনে নামোল্লেখিত ২৫ জন নবীর সংক্ষিপ্ত পরিচিতি ও কুরআনিক সূত্র
- হজ ও ওমরাহর ১৭ বিষয়ের শিক্ষামূলক নির্দেশিকা
- কুরআনের আয়াত, দোয়া, বিষয়ভিত্তিক পাঠ ও নবীদের পরিচিতির বুকমার্ক/সংরক্ষণ (একই ডিভাইস ও ব্রাউজারে)
- স্থানীয় বিষয়ভিত্তিক অনুসন্ধান: দোয়া, যিকির, পাঠ ও নবীদের পরিচিতি; কুরআন ও হাদিসের জন্য পৃথক পাঠক-অনুসন্ধান
- মোবাইল উপযোগী বিন্যাস এবং PWA ইনস্টল সুবিধা

## চালানো ও প্রকাশ
এটি static web app। index.html, sw.js, manifest.webmanifest এবং prophets-data.js একই প্রকাশিত ডিরেক্টরিতে রাখুন। GitHub Pages বা HTTPS সমর্থিত static hosting-এ প্রকাশ করা যায়। Service Worker কেবল HTTPS (বা localhost) পরিবেশে কাজ করে।

## ডেটা ও সংযোগ
- কুরআন: AlQuran Cloud API — https://alquran.cloud/api
- হাদিস: Hadith API dataset — https://github.com/fawazahmed0/hadith-api
- হাদিসের মূল পাঠ, অনুবাদ, numbering ও grading-এর ক্ষেত্রে সংস্করণভেদ থাকতে পারে। অ্যাপের অনলাইন ডেটাকে পূর্ণাঙ্গ/সমস্ত গ্রন্থের যাচাইকৃত সমালোচনামূলক সংস্করণ হিসেবে গণ্য করবেন না।
- Quran, Hadith ও recitation data আনতে ইন্টারনেট প্রয়োজন। Service Worker app shell ও স্থানীয় ফাইল ক্যাশ করে; তৃতীয় পক্ষের ধর্মীয় ডেটা বা অডিও অফলাইনে সংরক্ষণ করে না।

## ধর্মীয় তথ্য ব্যবহারের নীতি
- কুরআন ও নির্ভরযোগ্য হাদিসের সূত্র ছাড়া কোনো বর্ণনাকে নিশ্চিতভাবে সহিহ বলা যাবে না।
- হাদিসের নম্বর ও অনুবাদ প্রকাশনা/সংস্করণভেদে পরিবর্তিত হতে পারে।
- মতপার্থক্যপূর্ণ ফিকহি বিষয়ে স্থানীয় যোগ্য আলেমের পরামর্শ নিন। এই সংস্করণে হানাফি নির্দেশনাকে অগ্রাধিকার দেওয়া হয়েছে।
- অনুবাদ মূল আরবি কুরআনের বিকল্প নয়; অনুবাদকের পরিচয় ও ব্যাখ্যার পার্থক্য বিবেচনা করুন।

## Development
- Working branch: feature/islamic-library-expansion
- Validate workflow: .github/workflows/validate-development.yml
- GitHub Actions-এর static checks পাস করলেই বাস্তব Android/browser পরীক্ষা সম্পন্ন হয়েছে—এমন নয়। প্রকাশের আগে বিভিন্ন ডিভাইস, নেটওয়ার্ক, API availability, accessibility এবং ধর্মীয় কনটেন্ট আলাদাভাবে যাচাই করতে হবে।

## License and attribution
প্রতিটি তৃতীয় পক্ষের অনুবাদ, তাফসির, অডিও ও ডেটাসেটের নিজস্ব লাইসেন্স ও attribution শর্ত মানতে হবে। এই README কোনো তৃতীয় পক্ষের ডেটার মালিকানা দাবি করে না।


## Expanded study content (development branch)
- The prophets section includes detailed Bengali and English narrative summaries for all 25 prophets named in the Quran, with Quran references, lessons and explicit cautions where reliable chronological details are not available.
- Expanded topic lessons have been added for Hanafi prayer and purification, Aqeedah, Islamic history, Hajj and Umrah, fasting and zakat, janazah, and the Kaaba.
- Prophet biography text is included in local global search. The biographies are Quran-grounded learning summaries, not substitutes for full seerah works or scholarly research.
- The prayer and purification section has been expanded with detailed Bengali and English lessons on cleanliness, istinja, wudu, invalidators, wiping, ghusl, tayammum, menstruation/nifas/istihada, prayer conditions and pillars, wajibat/sunnahs, step-by-step prayer, recitation, postures, Witr, congregation, sajdah sahw, missed prayers, travel, illness, Friday/Eid prayers and post-prayer remembrance. These are educational summaries, not a scholar-reviewed fatwa manual; case-specific rulings require qualified Hanafi review.


## Expanded learning content (development branch)

- The prophets section now has separate Bengali and English narrative biographies for all 25 prophets named in the Quran, with Quran references, practical lessons and explicit notes where reliable primary sources do not provide a full chronology.
- The Aqeedah, Hanafi prayer, fasting, janazah and Islamic history sections include additional topic lessons with Bengali and English explanations.
- These additions are educational summaries, not personal fatwas. Detailed legal cases should be checked with qualified scholars. Historical claims are kept distinct from Quranic statements, and uncertain reports are not presented as established fact.
- Prophet biography data is maintained in `prophets-detail.js` and loaded by the app; the service worker shell cache is versioned to include it.
