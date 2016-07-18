import sys
nSysOnCompile=-1
def incremetSysOnCompile():
	global nSysOnCompile
	nSysOnCompile+= 1
	return nSysOnCompile




a=int(input())
b=0
for x in range(4):
	b+=int(sys.argv[1::][incremetSysOnCompile()])

print(a)
print(b)