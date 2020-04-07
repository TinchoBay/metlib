!===================================================================================================================================
!To python:
!f2py -c -m flib flib.f90

!To python env use this command:
!/home/joao/anaconda3/envs/env_py01/bin/f2py -c -m flib flib.f90
! need install gfortran in your system (sudo apt-get install gfortran)
! Last modify in 2020/04/06
!===================================================================================================================================
!===================================================================================================================================

subroutine cdiff2d(ysize, xsize, field, axis, output)
!23456------------------------------------------------------------------------------------------------------------------------------
      integer, intent(in) :: ysize, xsize
      integer, intent(in) :: axis
      real, intent(in) :: field(ysize,xsize)
      real, intent(out) :: output(ysize,xsize)
      integer dd1, dd2
      integer i, j
!23456------------------------------------------------------------------------------------------------------------------------------
      dd1 = 0
      dd2 = 0
      output = -999.99
!23456------------------------------------------------------------------------------------------------------------------------------
      if (axis==1) then !X
         dd1 = 1
      elseif (axis==0) then !Y
         dd2 = 1
      endif
!23456------------------------------------------------------------------------------------------------------------------------------
      do j=1+dd2,ysize-dd2
         do i=1+dd1,xsize-dd1
            if ((field(j+dd2,i+dd1)>-999.0).and.(field(j-dd2,i-dd1)>-999.0)) then
               output(j,i) = field(j+dd2,i+dd1) - field(j-dd2,i-dd1)
            endif
         enddo
      enddo
!23456------------------------------------------------------------------------------------------------------------------------------
end subroutine cdiff2d

!===================================================================================================================================
!===================================================================================================================================

subroutine cdiff3d(zsize, ysize, xsize, field, axis, output)
!23456------------------------------------------------------------------------------------------------------------------------------
      integer, intent(in) :: zsize, ysize, xsize
      integer, intent(in) :: axis
      real, intent(in) :: field(zsize,ysize,xsize)
      real, intent(out) :: output(zsize,ysize,xsize)
      integer dd1, dd2, dd3
      integer i, j, z
!23456------------------------------------------------------------------------------------------------------------------------------
      dd1 = 0
      dd2 = 0
      dd3 = 0
      output = -999.99
!23456------------------------------------------------------------------------------------------------------------------------------
      if (axis==2) then
         dd1 = 1
      elseif (axis==1) then
         dd2 = 1
      elseif (axis==0) then
         dd3 = 1
      endif
!23456------------------------------------------------------------------------------------------------------------------------------
      do z=1+dd3,zsize-dd3
         do j=1+dd2,ysize-dd2
            do i=1+dd1,xsize-dd1
               if ((field(z+dd3,j+dd2,i+dd1)>-999.0).and.(field(z-dd3,j-dd2,i-dd1)>-999.0)) then
                  output(z,j,i) = field(z+dd3,j+dd2,i+dd1) - field(z-dd3,j-dd2,i-dd1)
               endif
            enddo
         enddo
      enddo
!23456------------------------------------------------------------------------------------------------------------------------------
end subroutine cdiff3d

!===================================================================================================================================
!===================================================================================================================================

subroutine cdiff4d(tsize, zsize, ysize, xsize, field, axis, output)
!23456------------------------------------------------------------------------------------------------------------------------------
      integer, intent(in) :: tsize, zsize, ysize, xsize
      integer, intent(in) :: axis
      real, intent(in) :: field(tsize,zsize,ysize,xsize)
      real, intent(out) :: output(tsize,zsize,ysize,xsize)
      integer dd1, dd2, dd3, dd4
      integer i, j, z, t
!23456------------------------------------------------------------------------------------------------------------------------------
      dd1 = 0
      dd2 = 0
      dd3 = 0
      dd4 = 0
      output = -999.99
!23456------------------------------------------------------------------------------------------------------------------------------
      if (axis==3) then
         dd1 = 1
      elseif (axis==2) then
         dd2 = 1
      elseif (axis==1) then
         dd3 = 1
      elseif (axis==0) then
         dd4 = 1
      endif
!23456------------------------------------------------------------------------------------------------------------------------------
      do t=1+dd4,tsize-dd4
         do z=1+dd3,zsize-dd3
            do j=1+dd2,ysize-dd2
               do i=1+dd1,xsize-dd1
                  if ((field(t+dd4,z+dd3,j+dd2,i+dd1)>-999.0).and.(field(t-dd4,z-dd3,j-dd2,i-dd1)>-999.0)) then
                     output(t,z,j,i) = field(t+dd4,z+dd3,j+dd2,i+dd1) - field(t-dd4,z-dd3,j-dd2,i-dd1)
                  endif
               enddo
            enddo
         enddo
      enddo
!23456------------------------------------------------------------------------------------------------------------------------------
end subroutine cdiff4d

!===================================================================================================================================
!===================================================================================================================================

