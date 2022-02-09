load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"   
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_csm.ncl"   
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"
begin



; Main code
;----------------------------------------------------------------------
 
;---Recreating jpeg images only works for X11 and PNG.
;---Recreating jpeg images only works for X11 and PNG.
   wks_type = "png"
   wks_type@wkWidth = 2500
   wks_type@wkHeight = 2500 
   pname = "CLIM_850_200_OND_U_V"
   wks = gsn_open_wks("eps",pname)

  plot = new(2,graphic)                       ; create a plot array

;---Southern part of Africa
  minlat = -10
  maxlat =  25
  minlon = 60
  maxlon = 100

  res = True
  res@mpOutlineOn           = True
  res@gsnDraw                  = False
  res@gsnFrame                 = False
  res@mpMaxLatF             = maxlat
  res@mpMinLatF             = minlat
  res@mpMinLonF             = minlon
  res@mpMaxLonF             = maxlon
  res@pmTickMarkDisplayMode = "Always"   ; nicer tickmarks

  res@mpOutlineBoundarySets = "Geophysical"
  res@mpDataSetName         = "Earth..4" 
  res@mpDataBaseVersion     = "MediumRes"

       

;_________________________________________________________________________________

                                      
  f    = addfile ("UV_850_200_1979_2020_ONDmean.nc", "r")

  print(f)

  U=short2flt (f->u)
  V=short2flt (f->v)


 
  UCLIM_200=dim_avg_n_Wrap(U(0:41,0,:,:),0)
  VCLIM_200=dim_avg_n_Wrap(V(0:41,0,:,:),0) 
  UCLIM_850=dim_avg_n_Wrap(U(0:41,1,:,:),0)
  VCLIM_850=dim_avg_n_Wrap(V(0:41,1,:,:),0) 
 

  copy_VarCoords (U, UCLIM_200)
  copy_VarCoords (V, VCLIM_200)
  copy_VarCoords (U, UCLIM_850)
  copy_VarCoords (V, VCLIM_850)

  wspd_200  = wind_speed(UCLIM_200,VCLIM_200)
  wspd_850  = wind_speed(UCLIM_850,VCLIM_850)
;_______________________________________________________________________________________________________
  vcres                         = True
  vcres@gsnDraw                 = False
  vcres@gsnFrame                = False

  vcres@sfXCStartV = 40 
  vcres@sfXCEndV   = 100 
  vcres@sfYCStartV = -20 
  vcres@sfYCEndV   = 20 



  vcres@mpLimitMode                 = "LatLon"		    
  vcres@mpMinLatF                   = -20		  
  vcres@mpMaxLatF                   = 20
  vcres@mpMinLonF                   = 40			   
  vcres@mpMaxLonF                   = 100    

  ;vcres@vcLineArrowThicknessF     =   0.5                         ;-- make vector lines thicker (default: 1.0)
  vcres@vcRefMagnitudeF           = 3.5             ; define vector ref mag
  vcres@vcRefLengthF              = 0.02            ; define length of vec ref
  vcres@vcMinFracLengthF          = 0.3
  vcres@vcMinDistanceF            = 0.02
  vcres@vcRefAnnoOrthogonalPosF   = -0.14
  vcres@vcRefAnnoFontHeightF      = 0.012
  vcres@vcRefAnnoString2On        = False 
  ;vcres@vcGlyphStyle              = "CurlyVector"     ; turn on curly vectors
  vcres@vcLineArrowThicknessF   = 2.0               ; change vector thickness
  vcres@gsnRightString          = ""
  vcres@gsnLeftString           = "(a)"
  vcres@vcRefAnnoArrowUseVecColor = False           ; don't use vec color for ref
  vcres@vcVectorDrawOrder = "PreDraw" ; draw order 
;-------------------------------------




  cmap = read_colormap_file("wh-bl-gr-ye-re")

  ;vcres                          = True
  ;vcres@gsnDraw                  = False
  ;vcres@gsnFrame                 = False
  vcres@vcFillArrowsOn           = True
  ;vcres@gsnMaximize          =   True

  ;vcres@vcFillArrowFillColor     = "tomato4"

 
  vcres@vcMonoFillArrowFillColor = False     ; Color according to magnitude
  ;vcres@vcFillArrowEdgeColor     = "black"
  ;vcres@vcFillArrowWidthF        = 0.2
  ;vcres@gsnRightString           = ""
  ;vcres@gsnLeftString            = "" ;Jun-Aug El Nino and no Dry"
  ;vcres@vcRefMagnitudeF          = 4.0             ; define vector ref mag
  ;vcres@vcRefLengthF             = 0.028             ; define length of vec ref
  ;vcres@vcMinFracLengthF         = 0.4
  ;vcres@vcLineArrowThicknessF    = 1.5
  ;vcres@vcMinDistanceF           = 0.018
  ;vcres@vcRefAnnoOrthogonalPosF  = -0.30
  ;vcres@vcRefAnnoFontHeightF     = 0.008

  ;vcres@mpLimitMode                 = "LatLon"		    
  ;vcres@mpMinLatF                   = -20		  
  ;vcres@mpMaxLatF                   = 20
  ;vcres@mpMinLonF                   = 40			   
  ;vcres@mpMaxLonF                   = 100  
  
  vcres@vcLevelPalette           = cmap(6:193,:)
  vcres@vcLevelSelectionMode	 = "ManualLevels"
  vcres@vcMinLevelValF           = 0.0
  vcres@vcMaxLevelValF           = 4
  vcres@vcLevelSpacingF          = 0.5

  vcres@lbLabelBarOn              = True          ; turn off individual cb's 
  vcres@lbOrientation       = "Vertical"
  ;vcres@lbBoxEndCapStyle    = "TriangleBothEnds" 
  vcres@lbBoxEndCapStyle    = "TriangleHighEnd" 
  vcres@lbLabelFont                      = "times_roman"                              ; label font
  vcres@lbLabelFontHeightF               = 0.011  
  ;vcres@lbLabelPosition                  = "Center"                                      ; label position
  ;vcres@lbLabelAlignment                 = "BoxCenters"                                  ; label orientation
  vcres@lbLabelStride                    = 2             
  vcres@pmLabelBarWidthF            = 0.08                                          
  vcres@pmLabelBarHeightF           = 0.4
  ;vcres@pmLabelBarWidthF            = 0.4                                          
  ;vcres@pmLabelBarHeightF           = 0.08

  ;vcres@lbTitleOn          = True
  ;vcres@lbTitleString      = "Wind Speed in ms~S~-1"  ; (m~s~-1)
  ;vcres@lbTitleFontHeightF = 0.012
  ;vcres@lbTitleFont        = "times-roman" 

  ;vcres_sig  = vcre
  ;vcres_sig@vcMinDistanceF            = 0.02
  ;vcres_sig@vcLineArrowColor        = "red"
  ;vcres_sig@vcLineArrowThicknessF   = 2.5               ; change vector thickness


  ;vcres@MainTitle = False 
  ;vcres@tiMainOn = False                            ;
  ;vcres@Footer = False                                                 ; Set
 

  plot(0) = gsn_csm_map(wks,res) 
  plot(1) = gsn_csm_map(wks,res) 

  plot850 = gsn_csm_vector_scalar(wks,UCLIM_850,VCLIM_850,wspd_850,vcres) 

  vcres_200                          = vcres
  vcres_200@gsnDraw                  = False
  vcres_200@gsnFrame                 = False
  vcres_200@vcRefMagnitudeF          = 10.0             ; define vector ref mag
  vcres_200@vcLevelPalette           = cmap(6:193,:)
  vcres_200@vcLevelSelectionMode     = "ManualLevels"
  vcres_200@vcMinLevelValF           = 0.0
  vcres_200@vcMaxLevelValF           = 10
  vcres_200@vcLevelSpacingF          = 0.5
  vcres_200@gsnLeftString           = "(b)"


  plot200 = gsn_csm_vector_scalar(wks,UCLIM_200,VCLIM_200,wspd_200,vcres_200) 

 
  overlay(plot(0),plot850)
  overlay(plot(1),plot200) 

;----------------------------------------------
 


;---Overlay a red box
;---------------------------------------------------------
gres                  = True
gres@gsLineColor       = "Blue"   ; Polyline resources.
gres@gsLineThicknessF  = 3.0      ; thrice thickness
gres@gsFillColor       = "Red"    ; Polygon resources.
gres@gsFillIndex       = -1
;gres@gsFillOpacityF    = 2
gres@gsEdgesOn         = True     ; Line will be drawn around polygon.
gres@gsEdgeColor       = "black"
gres@gsEdgeThicknessF  = 3
gres@gsMarkerIndex     = 16       ; dots   # Polymarker resources.
gres@gsMarkerColor     = "HotPink"
gres@gsMarkerSizeF     = 0.014    ; twice normal size

xsquare = (/83.0,95.0,95.0,83.0,83.0/)    ; X and Y coordinates
ysquare = (/5,5, 10, 10, 5/)    ; for polygon.

Box  = gsn_add_polygon(wks,plot(0),xsquare,ysquare,gres)

xsquare2 = (/83.0,95.0,95.0,83.0,83.0/)    ; X and Y coordinates
ysquare2 = (/-2.5,-2.5, 2.5, 2.5, -2.5/)    ; for polygon.

gres@gsEdgeColor       = "blue"
Box2  = gsn_add_polygon(wks,plot(0),xsquare2,ysquare2,gres)
;---------------------------------------------------------
;---Equator line
  lnresq                  = True
  lnresq@gsLineColor      = "black" 
  lnresq@gsLineThicknessF = 2.0    
  lnresq@gsLineDashPattern = 2
  lonboxq = (/ 0, 180, 180, 0, 0/)
  latboxq = (/0,0,0,0,0/)

  EQLINE0    = gsn_add_polyline(wks,plot(0),lonboxq,latboxq,lnresq)
  EQLINE1    = gsn_add_polyline(wks,plot(1),lonboxq,latboxq,lnresq)


  resP                  	        = True                   	                ; modify the panel plot
  resP@gsnFrame                         = True                   	                ; don't advance panel plot
  resP@gsnPanelLabelBar 	        = False                 	                ; add common colorbar
  resP@lbBoxEndCapStyle                 = "TriangleBothEnds"

  resP@lbOrientation                    = "vertical"                                    ; vertical label bar
  resP@pmLabelBarWidthF                 = 0.04                                           ; default is shorter
  resP@pmLabelBarHeightF                = 0.18                                          ; default is taller
  resP@lbLabelStride                    = 2                                             ; skip every other label




  ;resP@lbPerimOn                        = False
  resP@lbLabelFont                      = 25                                            ; label font
  resP@lbLabelFontHeightF               = 0.011  
  ;resP@lbLabelPosition                  = "Center"                                      ; label position
  ;resP@lbLabelAlignment                 = "BoxCenters"                                  ; label orientation

  ;resP@txString         	        = "Composite of Sea Surface Temperature (TMI) (1998-2010)"  ; add common title
  ;resP@txFont                           = 2 
  ;resP@txFontHeightF                    = 0.015  
  ;resP@txFontColor                      = "Brown"
  ;resP@gsnPanelBottom   	        = 0.05                   	                ; add space at bottom
  resP@gsnPanelFigureStrings	        = (/"850 hPa","200 hPa"/) ; add strings to panel
  resP@gsnPanelFigureStringsFontHeightF = 0.01
  resP@gsnPanelFigureStringsBackgroundFillColor = "aliceblue"
  resP@gsnPanelFigureStringsFont        = 25
  resP@gsnMaximize                      = True                   ; use full page
  resP@amJust   		        = "TopLeft"
  ;resP@gsnPanelRowSpec                 = True                                          ; tell panel what order to plt



  gsn_panel(wks,plot,(/1,2/),resP) 

  draw(plot)
  frame(wks)     

 
  delete(wks)

  cmd = "convert -geometry 2500x2500 -density 300 -trim " + pname + ".eps " + \
                                                          pname + ".png"
  system(cmd)

end