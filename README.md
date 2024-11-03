# hpa-java-poc

Download and Install the Full JDK
https://www.oracle.com/java/technologies/javase/jdk17-archive-downloads.html

Update Environment Variables.
Under System variables, locate and select the Path variable, then click Edit.
Click New and add the path to your JDK’s bin folder, e.g., C:\Program Files\Java\jdk-17\bin.

docker build -t savipavan/hpa-java-app:latest .
docker push savipavan/hpa-java-app:latest

----
Observe HPA metrics

kubectl get hpa java-app-hpa --watch

----
Explanation of the Code
Increase Memory Usage: The application will add 10 MB to memory every 2 seconds for a total of around 100 MB increase.
Release Memory: After a set period (20 seconds in this case), the code will clear memoryConsumers and call System.gc() to suggest garbage collection, releasing the memory.
Pause: After clearing memory, the app waits for 30 seconds before repeating the memory spike.

-----
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update

-----

