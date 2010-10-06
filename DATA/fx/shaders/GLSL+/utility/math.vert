#version 150

mat4 quaternionToMatrix(in vec4 q)
{
	mat4 result;
	float xx, yy, zz, xy, xz, yz, wx, wy, wz;

	//Precalculate coordinate products
	xx = q.x * q.x;
	yy = q.y * q.y;
	zz = q.z * q.z;
	xy = q.x * q.y;
	xz = q.x * q.z;
	yz = q.y * q.z;
	wx = q.w * q.x;
	wy = q.w * q.y;
	wz = q.w * q.z;
 
	//Calculate 3x3 matrix from orthonormal basis
	result[0][0]  = 1.0 - 2.0*(yy + zz);
	result[0][1]  = 2.0*(xy + wz);
	result[0][2]  = 2.0*(xz - wy);
	result[0][3]  = 0.0;

	result[1][0]  = 2.0*(xy - wz);
	result[1][1]  = 1.0 - 2.0*(xx + zz);
	result[1][2]  = 2.0*(yz + wx);
	result[1][3]  = 0.0;

	result[2][0]  = 2.0*(xz + wy);
	result[2][1]  = 2.0*(yz - wx);
	result[2][2] = 1.0 - 2.0*(xx + yy);
	result[2][3] = 0.0;

	result[3][0] = 0.0;
	result[3][1] = 0.0;
	result[3][2] = 0.0;
	result[3][3] = 1.0;
	
	return result;
}

mat3 modelviewToNormal(in mat4 mv)
{
    mat3 nm;

    // Inverse
    nm[0][0] = mv[0][0];
    nm[0][1] = mv[1][0];
    nm[0][2] = mv[2][0];

    nm[1][0] = mv[0][1];
    nm[1][1] = mv[1][1];
    nm[1][2] = mv[2][1];

    nm[2][0] = mv[0][2];
    nm[2][1] = mv[1][2];
    nm[2][2] = mv[2][2];

    mat3 ret;

    // Transpose
    ret[0][0] = nm[0][0];
    ret[0][1] = nm[1][0];
    ret[0][2] = nm[2][0];

    ret[1][0] = nm[0][1];
    ret[1][1] = nm[1][1];
    ret[1][2] = nm[2][1];

    ret[2][0] = nm[0][2];
    ret[2][1] = nm[1][2];
    ret[2][2] = nm[2][2];

    return ret;
}
