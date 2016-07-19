import sys
nSysOnCompile=-1
def incremetSysOnCompile():
	global nSysOnCompile 
	nSysOnCompile+=1 
	return nSysOnCompile
print int(sys.argv[1::][incremetSysOnCompile()])+int(sys.argv[1::][incremetSysOnCompile()])