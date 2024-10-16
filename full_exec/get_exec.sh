#!/bin/bash
# Save an executable under ./bin and all its dependence libraries
# under ./bin/lib
# Use as get_exec path_to_executable
# (C) José R. Valverde, 2006
if [ ! -e ./bin ] ; then
    mkdir ./bin
fi
cp $1 bin/$1.x
if [ ! -e bin/lib ] ; then
    mkdir bin/lib
fi
#ldd $1 | cut -d' ' -f3 | grep -v ^/lib | grep -v ^/usr/lib | \
ldd $1 | sed -e 's/(.*)//g' | \
while read line ; do
    #echo ""
    echo $line | grep -q "=>" 
    if [ $? == 0 ] ; then
	#echo "regular"
    	file=`echo $line | cut -d ' ' -f3 | cut -d ' ' -f1`
    else
	#echo "sys"
	file=`echo $line |cut -d'	' -f2`
    fi
    #echo $file
    if [ -e "$file" ] ; then
	dir=`dirname $file`
	lib=`basename $file`
	echo mkdir -p bin/lib/$dir
	mkdir -p bin/lib/$dir
	echo cp $file bin/lib/$dir/$lib
    	cp $file bin/lib/$dir/$lib
    fi
done

# create a qemu invocation file
cat > bin/$1 <<EOF
#!/bin/bash
#
#
#THIS_SCRIPT=\$\(/bin/readlink -nf "$0"\)

SCRIPT_PATH=\$(cd \`dirname \${0}\`; pwd)
#echo \$SCRIPT_PATH

qemu-x86_64 -L \$SCRIPT_PATH/lib \$SCRIPT_PATH/$1.x \$*
EOF

