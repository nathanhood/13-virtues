
# Features
* Create an account with Email
* Create an account with Facebook
* Create/Choose virtues
* Create objectives (tangible goals)
  * set deadline
* Record daily records
  * Logs (journal entries)
  * Virtue ratings
* Set reminder for daily recording
* Set reminders for achieving objectives
* Complete Goals
* View virtue/objective progress and daily logs
* View daily report
* Change virtues
* Delete goals

# Stories

## User creates an account with email

As a user,
in order to begin using the website,
I want to create an account

**Usage:**
1. On homepage, click "Sign Up"

2. Fill out form
  * name
  * email
  * password
  * password confirmation
  * optional image upload

3. Promoter sees profile page

**Acceptance Criteria**
* User enters valid input to create new user
  * validate if email is not a duplicate
  * validate if email is an email
  * validate if passwords match
  * validate if password is at least 6 characters
  * validate if photo is either empty or a photo link
  * ensure that photo is saved at a file size of no larger than 100kb
* User is saved to the database through the user model with:
  * Name
  * Email
  * Photo Link
  * Password

---

## User creates an account with Facebook

As a user,
in order to begin using the website,
I want to create an account with my Facebook account

**Usage:**
1. On homepage, click "Sign Up"

2. Fill out form
  * click facebook icon
  * enter facebook account information when prompted

3. Promoter sees profile page

**Acceptance Criteria**
* User is prompted with Facebook Sign Up page
* User is saved to database with:
  * Name
  * Email
  * Photo Link
  * Token/OAuth information

---

## User creates/chooses virtues

As a user,
in order to start pursuing lifelong goals and virtues,
I want to create virtues or choose existing virtues

**Usage:**

1. On profile page, click prompt to add virtues

2. Add virtues from list by scrolling or keyword searching and selecting

3. If virtue does not exist, create new virtue on same page

4. 
