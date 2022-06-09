#########################################
#  
#  rus_personnel_losses_pareto.py
#  Cody Yoder; 8 June 2022
#  Description: This performs a pareto visualization on the output of "rus_personnel_losses_pareto_query.sql."
#  
######################################### 

#  <Imports>
import matplotlib.pyplot as plt
#  </Imports>
 
# x axis values
x = [1,2,3]
# corresponding y axis values
y = [2,4,1]
 
# plotting the points
plt.plot(x, y)
 
# naming the x axis
plt.xlabel('x - axis')
# naming the y axis
plt.ylabel('y - axis')
 
# giving a title to my graph
plt.title('My first graph!')
 
# function to show the plot
plt.show()