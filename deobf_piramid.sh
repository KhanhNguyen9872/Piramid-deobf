#!/usr/bin/bash
# KhanhNguyen9872
# https://fb.me/khanh10a1
# https://github.com/khanhnguyen9872

### Deobfuscate [Pejuang Kentang] ###

function deobfuscate() {
	string="$(tr -dc A-Za-z0-9 </dev/urandom | head -c 13 ; echo '')"
	${sudo} ln -s "$(which echo)" "${n}usr/bin/${string}"
	${sudo} rm -rf ./tmp_deobfuscate
	mkdir -p ./tmp_deobfuscate
	cp "$f" ./tmp_deobfuscate/original.sh
	f="original.sh"
	cd ./tmp_deobfuscate
	sed -i "s/;/\n/g" $f
	code=$(grep -a 'eval "$(eval $_command_dump -d <<<' $f | sed 's/eval "$(eval $_command_dump -d <<< "//g' | sed 's/")"//g' | base64 -d)
	for i in 1 2; do
		echo "$code" | sed "s/eval/${string}/g" > tmp0.sh
		code="$(bash tmp0.sh)"
	done
	echo "$code" | sed "s/;/\n/g" | grep 'base64 -d <<< $(rev <<<' | sed 's/base64 -d <<< $(rev <<< "//g' | sed 's/") >&7//g' | rev | base64 -d | sed "s/eval \"\$(cat <\&8)\";/${string} \"\$(cat <\&8)\";/" > tmp0.sh
	code="$(bash tmp0.sh)"
	for i in 1 2; do
		echo "$code" | sed "s/;/\n/" | sed "s/\$(eval \$__SPD__)/\$(${string} \$__SPD__)/" > tmp0.sh
		code="$(bash tmp0.sh)"
	done
	rm -rf tmp0.sh
	echo "$code" > result.sh
	${sudo} rm -rf "${n}usr/bin/${string}" >/dev/null 2>&1
}

if [[ "$(sudo echo 'KhanhNguyen9872')" == "KhanhNguyen9872" ]] 2> /dev/null || [[ "$(which bash)" == "/data/data/com.termux/files/usr/bin/bash" ]]; then
	if [[ "$(which sudo)" == "/data/data/com.termux/files/usr/bin/sudo" ]]; then
		n="/data/data/com.termux/files/"
		sudo=""
	else
		n="/"
		sudo="$(which sudo)"
	fi
	if [[ "$(which lzma)" == "" ]]; then
		${sudo} apt update -y
		${sudo} apt install lzma -y
		if [[ "$(which lzma)" == "" ]]; then
			printf "\nlzma missing! please install it!\n"
			exit 64
		fi
	fi
	if [[ "$(which hexdump)" == "" ]]; then
		${sudo} apt update -y
		${sudo} apt install bsdmainutils -y
		if [[ "$(which hexdump)" == "" ]]; then
			printf "\nhexdump missing! please install it!\n"
			exit 64
		fi
	fi
	printf "\nWelcome to my tool:3 [KhanhNguyen9872]\n"
else
	printf "Need su access!"
	exit 64
fi

printf "File Bash: "
read f
if [ -f "$f" ]; then
	deobfuscate
	echo "Done!"
else
	echo "Bash not found!"
fi
