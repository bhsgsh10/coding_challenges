/*
We have a list of points on the plane.  Find the K closest points to the origin (0, 0).

(Here, the distance between two points on a plane is the Euclidean distance.)

You may return the answer in any order.  The answer is guaranteed to be unique (except for the order that it is in.)

https://leetcode.com/problems/k-closest-points-to-origin/
*/

var kClosest = function(points, K) {
    /* We don't need to compute the distances separately. Here we are sorting the points based on how far they are from the origin.
    Since origin is (0,0), we can just compute sqrt(x^2 + y^2) to get the distance of (x,y) from origin. Furthermore, we don't need to
    calculate the square root for comparing the distances, as all distances are calculated by taking square root, so that operation
    is common and can be left out.
    */
    points.sort(function(a, b) {
        //Here a and b represent points in the form of [,]. So a[0] is the x-coordinate of a and a[1] is the y-ccordinate of a.
      return (a[0]*a[0] + a[1]*a[1]) - (b[0]*b[0] + b[1]*b[1])
    });
    
    return points.slice(0, K)
}