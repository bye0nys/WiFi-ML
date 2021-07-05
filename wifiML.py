import tensorflow as tf
import numpy as np
import matplotlib.pyplot as plt

tf.compat.v1.set_random_seed

xy = np.loadtxt("abc123.csv", delimiter=",", dtype=np.float32)

x_data = xy[:, 0:-1]
y_data = xy[:, [-1]]

x_test = [[28000], [17000], [38000]]

'''print(x_data.shape, x_data, len(x_data))
print(y_data.shape, y_data)'''

X = tf.placeholder(tf.float32, shape=[None, 1])
Y = tf.placeholder(tf.float32, shape=[None, 1])

'''W = tf.Variable(tf.random_normal([1]), name = 'weight')'''
b = tf.Variable(tf.random_normal([1]), name='bias')

hypothesis = X + b

cost = tf.reduce_mean(tf.square(hypothesis - Y))

train = tf.train.GradientDescentOptimizer(learning_rate=0.01).minimize(cost)

sess = tf.Session()

sess.run(tf.global_variables_initializer())

for step in range(2001):
    cost_val, hy_val, b_val, _ = sess.run([cost, hypothesis, b, train], feed_dict={X: x_data, Y: y_data})

    if step % 10 == 0:
        print(step, "Cost: ", cost_val, "\nPradiction : \n", hy_val, "\nBias : , ", b_val)

print("Prediction : ", sess.run(hypothesis, feed_dict={X: x_test}))

plt.figure()
plt.plot(y_data, x_data, '.r')
plt.plot(y_data, hy_val, '.')
x = np.linspace(0, 50000, 50000)
y = np.linspace(0, 50000, 50000)
plt.plot(x, y)

plt.grid()
plt.show()
