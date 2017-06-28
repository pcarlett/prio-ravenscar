# Makefile for Ravenscar Unit Test Programs
CC=leon-elf-gnatmake
INCLUDE=-I./raven-prio/
DEBUG=-g -O0
FLAGS=-a
LIBSDIR=raven-prio
SOURCES=*.ad*
BUILD=build

help:
	@echo ""
	@echo "******************************"
	@echo "** Help for Unit Test Debug **"
	@echo "******************************"
	@echo ""
	@echo "To make unit program to compile you have to specify which unit you want:"
	@echo ""
	@echo "-->  \"make unit01\": it build test for cyclic and delayed tasks"
	@echo "-->  \"make unit02\": it build test for cyclic and sporadic tasks with activations"
	@echo "-->  \"make unit03\": it build test for sporadic tasks and protected objects"
	@echo "-->  \"make unit04\": it build test for interrupts and protected objects"
	@echo "-->  \"make unit05\": it build test for deadline floor protocol"
	@echo ""
	@echo "Use \"make clean\" to remove any builded file"
	@echo ""

libs:
	$(CC) $(DEBUG) $(FLAGS) $(LIBSDIR)/$(SOURCES)

unit01:	libs
	$(CC) $(INCLUDE) $(DEBUG) unit01.adb

unit02:	libs
	$(CC) $(INCLUDE) $(DEBUG) unit02.adb

unit03:	libs
	$(CC) $(INCLUDE) $(DEBUG) unit03.adb

unit04:	libs
	$(CC) $(INCLUDE) $(DEBUG) unit04.adb

unit05:	libs
	$(CC) $(INCLUDE) $(DEBUG) unit05.adb

.PHONY: clean

clean: cleanlibs
	rm -rf *.o *.ali *.dg unit01 unit02 unit03 unit04 unit05

cleanlibs:
	rm -rf $(BUILD)/*.o $(BUILD)/*.ali
