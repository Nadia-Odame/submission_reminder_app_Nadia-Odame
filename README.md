# Submission Reminder App

## Overview
A shell based system that alerts students about upcoming assignment deadlines.

## Directory Structure
```

submission_reminder_{YourName}
├── app/
│   └── reminder.sh
├── modules/
│   └── functions.sh
├── assets/
│   └── submissions.txt
├── config/
│   └── config.env
└── startup.sh
````

## Setup Instructions
1. Clone this repository:
```
git clone https://github.com/Nadia-Odame/submission_reminder_app_Nadia-Odame.git
cd submission_reminder_app_Nadia-Odame
````

2. Run the environment creation script:

```
bash create_environment.sh
```

Enter your name when prompted.
3. Navigate into the generated folder:

```
cd submission_reminder_<YourName>
```
4. Start the application:

```
./startup.sh
```

## Example Output

```
Assignment: Shell Navigation
Days remaining to submit: 2 days
--------------------------------------------
Checking submissions in ./assets/submissions.txt
Reminder: Chinemerem has not submitted the Shell Navigation assignment!
Reminder: Divine has not submitted the Shell Navigation assignment!
Reminder: John has not submitted the Shell Navigation assignment!
Reminder: Peter has not submitted the Shell Navigation assignment!
Reminder: Paul has not submitted the Shell Navigation assignment!
```

## Author

```
Nadia Akua Nsiah Odame
---
