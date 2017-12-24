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

# Travis for c: Programa em C
travis : 
	git diff --cached --exit-code -- git-help.md 2>&1 1>/dev/null || false
	git diff --cached --exit-code -- LICENSE 2>&1 1>/dev/null || false
	git diff --cached --exit-code -- makefile 2>&1 1>/dev/null || false
	git diff --cached --exit-code -- README.md 2>&1 1>/dev/null || false
	! git diff --cached --exit-code -- spacewar-rules.md 2>&1 1>/dev/null || false
	@if [[ $(shell git diff --cached -- spacewar-rules.md | tail -n2 | grep -c "+") != 1 ]] ; then false ; fi
	let LLA=$$(git diff --cached -- spacewar-rules.md | tail -n2 | head -n1 | tr -d " " | cut -d "." -f1)
	let LLB=$$(git diff --cached -- spacewar-rules.md | tail -n1 | cut -d "." -f1)
	let LLA=$$(( $${LLA} + 1 ))
	if [[ $${LLA} != $${LLB} ]] ; then false ; fi


# override built-in rules for mathing everything (exactly the same rule as %.x above)
% : %.c $(OBJ) $(SRC)
	-$(CC) $(CFLAGS) $(CPPFLAGS) $(LDLIBS) $^ -o $@ 2>&1 | tee errors.err
	@echo $@ version $(VERSION) > VERSION
ifeq "$(CCCOLOR)" "always"
	@sed -i -r "s/\x1B\[(([0-9]+)(;[0-9]+)*)?[m,K,H,f,J]//g" errors.err
endif
	-@[ ! -s errors.err ] && echo $@ version $(VERSION) > VERSION

nomatch :
	@echo 'makefile error: no rules for the given goal(s)' $(warning nomatch)

# CUIDADO! Apaga tudo que o makefile pode criar.
wipe :
	rm -f *.x *.so *.o errors.err tags a.out

# Apaga temporarios desnecessarios.
clean :
	rm -f *.o errors.err

copy :
	-cp $(PRG).c ../trabalhos 			# c source code
	-cp $(PRG).h ../trabalhos 			# c library source code
	-cp $(PRG).x ../trabalhos			# binary from c source code
	-cp $(PRG).gpt ../trabalhos			# portugol source code
	-cp $(PRG).gpt.x ../trabalhos		# binary from portugol source code
	-cp $(PRG).bf ../trabalhos			# brainforce source code
	-cp $(PRG).bf.x ../trabalhos		# binary from brainforce source code
	-cp $(PRG).cpl.x ../trabalhos		# binary from c code with some prolog predicates linked to it
	-cp $(PRG).pl ../trabalhos			# prolog source code
	-cp $(PRG).pl.x ../trabalhos		# binary from prolog source code
	-cp $(PRG).so ../trabalhos			# shared library object from c source code
	-cp $(PRG).pl.so ../trabalhos		# c library object with some functions that may be called by a prolog program

# Gera arquivo de indice tags com funcoes de todos fontes em C
tags :
	ctags -R
	ctags -R -x | less -F

# Gera um novo peN
euler :
	@cp -i peN.c pe$(N).c
	@sed -i 's/PEN.c   /$(PENAME)/' pe$(N).c
	@sed -i 's/PEN pe ## N/PEN pe ## $(N)/' pe$(N).c
	@echo "pe$(N).c"

#* ------------------------------------------------------------------- *
#* makefile config for Vim modeline                                    *
#* vi: set ai noet ts=4 sw=4 tw=0 wm=0 fo=croqlt :                     *
#* Template by Dr. Beco <rcb at beco dot cc> Version 20170506.191339   *

