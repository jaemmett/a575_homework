pro q26

loadct,39
hess=readfits('q26.fits',h)
hess=REBIN(hess,500,500)
print,size(hess)
window,0,xsize=(size(hess))[1],ysize=(size(hess))[2]
tv,255.0*(hess/max(hess))

WRITE_PNG, 'q26.png', TVRD(/TRUE)

end
