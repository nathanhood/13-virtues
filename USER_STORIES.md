
# Features
* Create an account with Email X
* Create an account with Facebook
* Create/Choose virtues X
* Create objectives (tangible goals)
  * set deadline
* Record daily records
  * Logs (journal entries)
  * Virtue ratings
* Set reminder for daily recording
* Set reminders for achieving objectives
* Complete Goals
* View virtue/objective progress
* View daily entries
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
  * validate if password is at least 8 characters
  * validate if photo is either empty or a photo link (photo will be added after account creation)
  * ensure that photo is saved at a file size of no larger than 100kb
* User is saved to the database through the user model with:
  * Name - empty
  * Email
  * Photo Link - empty
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
I want to create virtues or choose from a list of existing virtues

**Usage:**
1. On profile page, click prompt to add virtues

2. Add virtues from list by scrolling or keyword searching

3. If virtue does not exist, create new virtue on same page, virtue will be created

**Acceptance Criteria**
* User is prompted to add/create virtues
* Virtues must be unique
* Virtue is created if it does not already exist
* Virtue and User are added to join table

## User records daily records

As a user,
in order to track my progress in pursuing virtues,
I want to create daily reports wherein I rate myself on each user
and write a daily journal to help process the day's events

**Usage:**
1. On profile page, click "Add Daily Report"

2. Choose score for each virtue and type daily journal entry

3. Click "Submit Report"

**Acceptance Criteria**
* All virtues are required to be rated
* Journal entry is optional
* More than one report can be created per day

## User views virtue/objective progress

As a user,
in order to review my virtuous goals,
I want to be able to see the history of my daily virtue ratings

**Usage:**
1. On profile page, user can view graphs that show
  * Main graph (weekly, monthly, year, etc)
  * Pie chart with average scores per virtue
  * Bar graph with average scores per virtue
