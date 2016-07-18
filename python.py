import sys
nSysOnCompile=-1
def incremetSysOnCompile():
	global nSysOnCompile 
	nSysOnCompile+=1 
	return nSysOnCompile
if(float(sys.argv[1::][incremetSysOnCompile()]) %2==0):
  print "par"
else:
  print "impar"