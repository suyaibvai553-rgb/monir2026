# Hosting Project — PHP + MySQL

এই project আপনার specification অনুযায়ী তৈরি করা হয়েছে। এটি Android app-এর জন্য key/username + HWID login API, admin user management, app update check এবং optional APK hash verification দেয়।

## যা আছে

- `admin/` — admin login, dashboard, user create/activate/ban/delete, settings
- `api/connect.php` — POST login endpoint
- `api/update.php` — GET app version/update endpoint
- `api/apkhash.php` — POST APK hash check endpoint
- `includes/` — database, authentication, CSRF ও helper code
- `database.sql` — MySQL tables এবং default settings

## গুরুত্বপূর্ণ hosting কথা

এই project PHP + MySQL-এর জন্য। cPanel/shared PHP hosting-এ upload করুন। Netlify-এর drag-and-drop hosting-এ PHP server ও MySQL সরাসরি চলে না।

## Installation — সহজ ধাপ

1. cPanel-এ একটি MySQL database, database user এবং password তৈরি করুন।
2. `database.sql` phpMyAdmin-এ import করুন।
3. পুরো `hosting_project` folder-এর ভেতরের সব file আপনার domain-এর `public_html`-এ upload করুন।
4. `includes/config.php` খুলে `DB_NAME`, `DB_USER`, `DB_PASS`-এ আপনার database তথ্য বসান। `DB_HOST` সাধারণত `localhost` থাকে।
5. Browser-এ `https://YOUR_DOMAIN.com/admin/` খুলুন।
6. প্রথমবার নিজের admin username/password তৈরি করুন। এই password Android user-এর সঙ্গে সম্পর্কিত নয়।

## Android links

আপনার domain বসিয়ে:

```text
https://YOUR_DOMAIN.com/api/connect.php
https://YOUR_DOMAIN.com/api/update.php?version=1.0
https://YOUR_DOMAIN.com/api/apkhash.php
```

`connect.php`-তে JSON POST body:

```json
{
  "game": "your-app",
  "key": "USER_KEY",
  "hwid": "ANDROID_HWID",
  "publicKey": "OPTIONAL_PUBLIC_KEY"
}
```

সফল response-এর `status` হবে `true`। Admin panel-এ user-এর username/key এবং HWID একইভাবে বসাতে হবে।

## Security notes

- Live site-এ অবশ্যই HTTPS ব্যবহার করুন।
- `includes/config.php`-তে database password রাখার পর file permission ঠিক রাখুন।
- প্রথম admin তৈরি হওয়ার পর অন্য কেউ setup করতে পারবে না, কারণ setup কেবল তখনই দেখায় যখন `admins` table খালি।
- আপনার Android app-এর পুরনো code যদি শুধুমাত্র key/HWID পাঠায়, এই API সেই format রাখে।