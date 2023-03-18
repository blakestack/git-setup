#!/bin/bash

echo "Setting up Git..."
sleep 3

echo "Setting global user.name..."
sleep 1
git config --global user.name "Blakedav208"
echo "Setting global user.email..."
sleep 1
git config --global user.email "users.noreply.github.com"

echo "Changing default branch to main..."
sleep 3
git config --global init.defaultBranch main

echo "Enabling colorful output..."
git config --global color.ui auto

