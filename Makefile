### Build and deploy CV

SSH_USER = kbkaylan_kbkaylan@ssh.phx.nearlyfreespeech.net
DOCUMENT_ROOT = /home/public/pdf/
LOCAL_ROOT = /Users/kkaylan/Library/Mobile\ Documents/com\~apple\~CloudDocs/Website/static/pdf/

all: deploy

build:
	arara cv.tex

deploy: build
	cp cv.pdf $(LOCAL_ROOT)/vita.pdf
	rsync -crzve 'ssh -p 22' cv.pdf $(SSH_USER):$(DOCUMENT_ROOT)/vita.pdf
