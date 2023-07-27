HOME_REPO = $(PWD)/home
CONFIG_REPO = $(PWD)/config
SCRIPTS_REPO = $(PWD)/scripts
ETC_REPO = $(PWD)/etc

HOME_DIR = $(HOME)
CONFIG_DIR = $(HOME)/.config
SCRIPTS_DIR = $(HOME)/scripts
ETC_DIR = /etc

LN = ln -svf
MV = mv -v
MD = mkdir -pv

.PHONY: all user system

all: user system



home:
	$(LN) $(HOME_REPO)/zshrc $(HOME_DIR)/.zshrc

config:
	$(MD) $(CONFIG_DIR)/kitty
	$(LN) $(CONFIG_REPO)/kitty/kitty.conf $(CONFIG_DIR)/kitty.conf

scripts:

user: home config scripts

system: etc

