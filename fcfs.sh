echo -n "Enter the number of processes: "
read n

for((i=0; i<n; i++))
do
 echo -n "Enter the Burst Time $i: "
 read bt[$i]
done

((wt[i] = 0))
((tat[i] = bt[i]))

echo ""
echo "PROCESS  BURST TIME  WAITING TIME  TURNAROUND TIME"
echo "-------  ----------  ------------  ---------------"

for((i=0; i<n; i++))
do

((wt[i] = tat[i-1]))
((tat[i] = bt[i] + wt[i]))

echo "   $i         ${bt[i]}            ${wt[i]}              ${tat[i]}"
done
