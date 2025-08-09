#!/bin/bash

# Ask for name
read -p "Enter your name: " username

# Create base directory
base_dir="submission_reminder_${username}"
mkdir -p "$base_dir"/{app,modules,assets,config}

# Create files with provided content
# config.env
cat <<EOL > "$base_dir/config/config.env"
# This is the config file 
ASSIGNMENT="Shell Navigation"
DAYS_REMAINING=2
EOL

# reminder.sh
cat <<'EOL' > "$base_dir/app/reminder.sh"
#!/bin/bash
source ./config/config.env
source ./modules/functions.sh
submissions_file="./assets/submissions.txt"
echo "Assignment: $ASSIGNMENT"
echo "Days remaining to submit: $DAYS_REMAINING days"
echo "--------------------------------------------"
check_submissions $submissions_file
EOL
chmod +x "$base_dir/app/reminder.sh"

# functions.sh
cat <<'EOL' > "$base_dir/modules/functions.sh"
#!/bin/bash
function check_submissions {
    local submissions_file=$1
    echo "Checking submissions in $submissions_file"
    while IFS=, read -r student assignment status; do
        student=$(echo "$student" | xargs)
        assignment=$(echo "$assignment" | xargs)
        status=$(echo "$status" | xargs)
        if [[ "$assignment" == "$ASSIGNMENT" && "$status" == "not submitted" ]]; then
            echo "Reminder: $student has not submitted the $ASSIGNMENT assignment!"
        fi
    done < <(tail -n +2 "$submissions_file")
}
EOL
chmod +x "$base_dir/modules/functions.sh"

# submissions.txt
cat <<EOL > "$base_dir/assets/submissions.txt"
student, assignment, submission status
Chinemerem, Shell Navigation, not submitted
Chiagoziem, Git, submitted
Divine, Shell Navigation, not submitted
Anissa, Shell Basics, submitted
John, Shell Navigation, not submitted
Jane, Shell Navigation, submitted
Peter, Shell Navigation, not submitted
Mary, Shell Navigation, submitted
Paul, Shell Navigation, not submitted
EOL

# startup.sh
cat <<'EOL' > "$base_dir/startup.sh"
#!/bin/bash
./app/reminder.sh
EOL
chmod +x "$base_dir/startup.sh"

echo "Environment created successfully in $base_dir"
