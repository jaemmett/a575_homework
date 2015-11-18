pro q25

loadct,39
hess=readfits('q25.fits',h)
hess=REBIN(hess,500,500)
print,size(hess)
window,0,xsize=(size(hess))[1],ysize=(size(hess))[2]
tv,255.0*(hess/max(hess))

WRITE_PNG, 'q25.png', TVRD(/TRUE)

end
