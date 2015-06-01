#!/bin/bash

source repo-helpers.sh

push nedapi:current
push nedcas:current
push akita:current
push mailcatcher:latest

list_images
