#***************************************************************************
#*   Autoversion makefile                  v.20171224.175810   (spacewar)  *
#*   Copyright (C) 2014-2017 by Ruben Carlo Benante <rcb@beco.cc>          *
#*                                                                         *
#*   This makefile sets BUILD and allows to set MAJOR.MINOR version,       *
#*   DEBUG and OBJ to compile a range of different targets                 *
#***************************************************************************
#*   This program is free software; you can redistribute it and/or modify  *
#*   it under the terms of the GNU General Public License as published by  *
#*   the Free Software Foundation; version 2 of the License.               *
#*                                                                         *
#*   This program is distributed in the hope that it will be useful,       *
#*   but WITHOUT ANY WARRANTY; without even the implied warranty of        *
#*   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the         *
#*   GNU General Public License for more details.                          *
#*                                                                         *
#*   You should have received a copy of the GNU General Public License     *
#*   along with this program; if not, write to the                         *
#*   Free Software Foundation, Inc.,                                       *
#*   59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.             *
#***************************************************************************
#*   To contact the author, please write to:                               *
#*   Ruben Carlo Benante                                                   *
#*   Email: rcb@beco.cc                                                    *
#*   Webpage: http://drbeco.github.io/                                     *
#***************************************************************************
#
# Usage:
#
# * From linux prompt:
#    - Travis Continuous Integration Test (C program):
#    	$ make travis
#
# * Directly from vim editor command line:
#    - Travis test
#        :make
#
#

# disable builtin rules with MAKEFLAGS and .SUFFIXES
MAKEFLAGS += --no-builtin-rules
#.SUFFIXES:
# Allow variables to be seen
.ONESHELL:
.PHONY: clean wipe nomatch
# SHELL=/bin/bash -o pipefail
SHELL=/bin/bash

# version major number
MAJOR ?= 0
# version minor number
MINOR ?= 1
# build date
BUILD = $(shell date +"%g%m%d.%H%M%S")
# automatic version number
VERSION = "\"$(MAJOR).$(MINOR).$(BUILD)\""
# c compiler
CC = gcc

# Travis for Spacewar
wrongfiles :
	# modified wrong file
	git diff HEAD^ HEAD --exit-code -- git-help.md 2>&1 1>/dev/null || exit 1
	git diff HEAD^ HEAD --exit-code -- LICENSE 2>&1 1>/dev/null || exit 1
	git diff HEAD^ HEAD --exit-code -- makefile 2>&1 1>/dev/null || exit 1
	git diff HEAD^ HEAD --exit-code -- README.md 2>&1 1>/dev/null || exit 1
	#git diff --cached --exit-code -- git-help.md 2>&1 1>/dev/null || exit 1
	#git diff --cached --exit-code -- LICENSE 2>&1 1>/dev/null || exit 1
	#git diff --cached --exit-code -- makefile 2>&1 1>/dev/null || exit 1
	#git diff --cached --exit-code -- README.md 2>&1 1>/dev/null || exit 1

changerules :
	# didn't modify the rules file
	! git diff HEAD^ HEAD --exit-code -- spacewar-rules.md 2>&1 1>/dev/null || exit 1
	#! git diff --cached --exit-code -- spacewar-rules.md 2>&1 1>/dev/null || exit 1

wronglines :
	# modified wrong lines
	@if [[ $(shell git diff HEAD^ HEAD -- spacewar-rules.md | tail -n+6 | grep -c "+") != 1 ]] ; then exit 1 ; fi
	#@if [[ $(shell git diff --cached -- spacewar-rules.md | tail -n+6 | grep -c "+") != 1 ]] ; then exit 1 ; fi

rulenumber :
	# number is incorrect
	let LLA=$$(git diff HEAD^ HEAD -- spacewar-rules.md | tail -n2 | head -n1 | tr -d " " | cut -d "." -f1)
	let LLB=$$(git diff HEAD^ HEAD -- spacewar-rules.md | tail -n1 | cut -d "." -f1)
	#let LLA=$$(git diff --cached -- spacewar-rules.md | tail -n2 | head -n1 | tr -d " " | cut -d "." -f1)
	#let LLB=$$(git diff --cached -- spacewar-rules.md | tail -n1 | cut -d "." -f1)
	let LLA=$$(( $${LLA} + 1 ))
	if [[ $${LLA} != $${LLB} ]] ; then exit 1 ; fi

ruletwice :
	# edited the same rule twice
	if [[ "$$(git diff HEAD^ HEAD -- spacewar-rules.md | tail -n2 | head -n1 | cut -d. -f2)" == "$$(git diff HEAD^ HEAD -- spacewar-rules.md | tail -n1 | cut -d. -f2)" ]] ; then exit 1 ; fi
	#if [[ "$$(git diff --cached -- spacewar-rules.md | tail -n2 | head -n1 | cut -d. -f2)" == "$$(git diff --cached -- spacewar-rules.md | tail -n1 | cut -d. -f2)" ]] ; then exit 1 ; fi

nomatch :
	@echo 'makefile error: no rules for the given goal(s)' $(warning nomatch)

#* ------------------------------------------------------------------- *
#* makefile config for Vim modeline                                    *
#* vi: set ai noet ts=4 sw=4 tw=0 wm=0 fo=croqlt :                     *
#* Template by Dr. Beco <rcb at beco dot cc> Version 20170506.191339   *

