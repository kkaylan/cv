### Build and deploy CV

SSH_USER = kbkaylan_kbkaylan@ssh.nyc1.nearlyfreespeech.net
DOCUMENT_ROOT = /home/public/pdf
LOCAL_ROOT = "/Users/kerimkaylan/Sync/10-19 Meta/10 Git/10.2 Website/pdf"

all: deploy

build:
	arara cv.tex

deploy: build
	cp cv.pdf $(LOCAL_ROOT)/cv.pdf
	rsync -crzve 'ssh -p 22' cv.pdf $(SSH_USER):$(DOCUMENT_ROOT)/cv.pdf
