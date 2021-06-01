echo -n "Enter the number of processes: "
read n

for((i=0; i<n; i++))
do
 ((p[i]=i))
 echo -n "Enter the Burst Time $i: "
 read bt[$i]
done

for((i=0; i<n; i++))
do
for((k=i+1; k<n; k++))
do

if ((bt[i]>bt[k]))
then

 ((temp = bt[i]))
 ((bt[i] = bt[k]))
 ((bt[k] = temp))

 ((temp = p[i]))
 ((p[i] = p[k]))
 ((p[k] = temp))

fi
done
done

 ((wt[i] = 0))
 ((tat[i] = bt[i]))

echo ""
echo "PROCESS  BURST TIME  WAITING TIME  TURNAROUND TIME"
echo "-------  ----------  ------------  ---------------"

for((i=0; i<n; i++))
do
 ((wt[i] = tat[i-1]))
 ((tat[i] = wt[i] + bt[i]))

echo "   ${p[i]}         ${bt[i]}            ${wt[i]}              ${tat[i]}"
done


