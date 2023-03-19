#!/bin/bash

echo "Setting up Git..."
sleep 3
echo "What is your GitHub username?"
read -p 'Username: ' username
echo "Setting global user.name..."
sleep 1
git config --global user.name $username
sleep 2
echo "What is your GitHub user email?"
sleep 1
read -p 'Email Address: ' email
echo "Setting global user.email..."
git config --global user.email $email
sleep 2
echo "Changing default branch to main..."
sleep 3
git config --global init.defaultBranch main

echo "Enabling colorful output..."
git config --global color.ui auto
sleep 1
echo "Setting the default branch reconciliation behavior to 'merge'..."
git config --global pull.rebase false
sleep 2

echo "Confirming that your username and email address are correct..."
sleep 2
echo "Username - "
git config --get user.name
echo "Email - "
git config --get user.email

read -p 'Are these values correct? (y/n) ' response

if [ "$response" = "y" ]; then
  echo "Great, let's continue..."
else
	echo "Let's fix that..."
fi

sleep 2

read -p 'Are you a Mac user? (y/n) ' macuser
 if [ "$macuser" = "y" ]; then
      echo "Great, let's continue..."
      echo "ignoring pesky .DS_Store files so they do not show up in your commits."
      sleep 1
      echo .DS_Store >> ~/.gitignore_global
      git config --global core.excludesfile ~/.gitignore_global
    else
            echo "Alright, let's continue"
    fi
   
    sleep 2

 echo "Checking if you have an Ed25519 algorithm SSH key already installed."
 ls ~/.ssh/id_ed25519.pub
sleep 2

 if ls ~/.ssh/id_ed25519.pub | grep -q 'No such file or directory'; then
  echo "We need to create an Ed25519 algorithm SSH key"
  sleep 1
  echo "Generating SSH key..."
    sleep 1
    yes "" | ssh-keygen -t ed25519 -C $email
   
    echo "Saving to default location..."
    echo "No passoword set, (can be set later)."
    sleep 1
else
	echo "Alright."
fi

echo "Your SSH key: "
cat ~/.ssh/id_ed25519.pub

echo "Next you need to copy your public SSH key."
sleep 1
echo "Highlight and copy the output, which starts with 'ssh-ed25519' and ends with your email address."
sleep 2

echo "Now, go to GitHub in your browser window and paste the key you copied into the SSH  key field. Keep the key type as 'Authentication Key' and then, click 'Add SSH key'."

sleep 1

echo "Awesome, your ready to commit."
sleep 1

echo "You can follow this link to verify your SSH connection."

printf '\e]8;;https://docs.github.com/en/authentication/connecting-to-github-with-ssh/testing-your-ssh-connection\e\\Article from GitHub\e]8;;\e\\\n'

echo "You should see this response in your terminal after running the commands: 'Hi username! You’ve successfully authenticated, but GitHub does not provide shell access.'"
