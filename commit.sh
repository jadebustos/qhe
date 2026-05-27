#!/bin/bash
# Copyright 2026 (c) José Ángel de Bustos Pérez 
#   Author: José Ángel de Bustos Pérez <jadebustos@gmail.com>
#
# This file is free software: you can redistribute it and/or modify it under the terms of 
# the GNU General Public License v3 as published by the Free Software Foundation.
# IdM workshop is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; 
# without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. 
# See the GNU General Public License v3 for more details.

# You should have received a copy of the GNU General Public License v3
# If not, see https://www.gnu.org/licenses/gpl-3.0.en.html.

if [ $? -eq 0 ]
then
    git add . ; LANG=C git commit -S -m "$1" ; git push
else
    echo "Error: Commit failed. Please check the output for details and fix any issues before committing."
    exit 1
fi

if [ $? -eq 0 ]
then
    git checkout main
else
    echo "Error: Failed to switch to main branch. Please check the output for details and fix any issues before committing."
    exit 1
fi  

if [ $? -eq 0 ]
then
    git merge dev
else
    echo "Error: Failed to merge dev into main. Please check the output for details and fix any issues before committing."
    exit 1
fi

if [ $? -eq 0 ]
then
    git push
else
    echo "Error: Failed to push changes. Please check the output for details and fix any issues before committing."
    exit 1
fi

if [ $? -eq 0 ]
then
    git checkout dev
else
    echo "Error: Failed to switch back to dev branch. Please check the output for details and fix any issues before committing."
    exit 1
fi 
