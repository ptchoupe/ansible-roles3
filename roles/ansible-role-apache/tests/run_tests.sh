#!/bin/bash

ansible-playbook test.yml --diff -i inventory $@

