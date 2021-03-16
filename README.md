# form-test-project

## HOW TO RUN
* Clone project `git clone https://github.com/knky-ru/form-test-project.git`

### Database
* Make sure you have local MySQL server installed
* Create database with credentials `\mysql\creds.txt`
* Load `\mysql\dump.sql` to database or run migrations and seeders

### Run Vue.js frontend app
* Make sure you have Node.js installed https://nodejs.org/en/download/
* Open terminal and go to `\front-table\` folder
* Run `npm install` to load dependencies
* Run `npm run serve` to start FrontEnd

### Run Laravel backend app
* Make sure you have Composer installed https://getcomposer.org/download/ (using PHP 7.4)
* Check Laravel Docs for more info: https://laravel.com/docs/8.x/deployment#server-requirements
* Open terminal and go to `\backend\` folder
* Run `composer install` to load dependencies
* Run `php artisan serve` to start backend
* Make sure it started at port 8000.

### Open app
* Open http://localhost:8080/ 
