
begin

 
;---Recreating jpeg images only works for X11 and PNG.
;---Recreating jpeg images only works for X11 and PNG.
   wks_type = "png"
   wks_type@wkWidth = 2500
   wks_type@wkHeight = 2500 
   pname = "IOD_ANOM"
   wks = gsn_open_wks("eps",pname)
;_______________________________________________________________________________________
 
   f_change1     = addfile("./LLC_Part2/IOD_composite/New/PIOD/SST/PIOD_Anom_SST_1979_2020.nc","r")
   f_change2     = addfile("./LLC_Part2/IOD_composite/New/NIOD/SST/NIOD_Anom_SST_1979_2020.nc","r")
   f_change3     = addfile("./LLC_Part2/TCHP/PIOD/PIOD_Anom_TCHP_1979_2020.nc","r")
   f_change4     = addfile("./LLC_Part2/TCHP/NIOD/NIOD_Anom_TCHP_1979_2020.nc","r")
   f_change5     = addfile("./LLC_Part2/IOD_composite/New/PIOD/RH/PIOD_Anom_RH_1979_2020.nc","r")
   f_change6     = addfile("./LLC_Part2/IOD_composite/New/NIOD/RH/NIOD_Anom_RH_1979_2020.nc","r")
   f_change7     = addfile("./LLC_Part2/IOD_composite/New/PIOD/VSHEAR/PIOD_Anom_VSHEAR_1979_2020.nc","r")
   f_change8     = addfile("./LLC_Part2/IOD_composite/New/NIOD/VSHEAR/NIOD_Anom_VSHEAR_1979_2020.nc","r")
   f_change9     = addfile("./LLC_Part2/IOD_composite/New/PIOD/RVORT/PIOD_Anom_RVORT_1979_2020.nc","r")
   f_change10    = addfile("./LLC_Part2/IOD_composite/New/NIOD/RVORT/NIOD_Anom_RVORT_1979_2020.nc","r")



   print(f_change10)


   diff1 = f_change1->change(:,:)
   diff2 = f_change2->change(:,:)


   dif3   = f_change3->change(:,:)
   dif4   = f_change4->change(:,:)
   diff3  =dif3*10^-8
   diff4  =dif4*10^-8
   copy_VarCoords (dif3, diff3)
   copy_VarCoords (dif4, diff4)

   diff5  = f_change5->change(:,:)
   diff6  = f_change6->change(:,:)
   diff7  = f_change7->change(:,:)
   diff8  = f_change8->change(:,:)

   dif9   = f_change9->change(:,:)
   dif10  = f_change10->change(:,:)
   diff9  =dif9*10^6
   diff10 =dif10*10^6
   copy_VarCoords (dif9, diff9)
   copy_VarCoords (dif10, diff10)



   ttest_Abs1      = f_change1->alpha(:,:)
   ttest_Abs2      = f_change2->alpha(:,:)
   ttest_Abs3      = f_change3->alpha(:,:)
   ttest_Abs4      = f_change4->alpha(:,:)
   ttest_Abs5      = f_change5->alpha(:,:)
   ttest_Abs6      = f_change6->alpha(:,:)
   ttest_Abs7      = f_change7->alpha(:,:)
   ttest_Abs8      = f_change8->alpha(:,:)
   ttest_Abs9      = f_change9->alpha(:,:)
   ttest_Abs10     = f_change10->alpha(:,:)

   ttest_Abs1@_FillValue = -9.999999999999999e+33
   ttest_Abs2@_FillValue = -9.999999999999999e+33
   ttest_Abs3@_FillValue = -9.999999999999999e+33
   ttest_Abs4@_FillValue = -9.999999999999999e+33
   ttest_Abs5@_FillValue = -9.999999999999999e+33
   ttest_Abs6@_FillValue = -9.999999999999999e+33
   ttest_Abs7@_FillValue = -9.999999999999999e+33
   ttest_Abs8@_FillValue = -9.999999999999999e+33
   ttest_Abs9@_FillValue = -9.999999999999999e+33
   ttest_Abs10@_FillValue = -9.999999999999999e+33

   diff1&latitude@units="degrees_north"
   diff1&longitude@units="degrees_east"
   diff2&latitude@units="degrees_north"
   diff2&longitude@units="degrees_east"
   diff3&LAT@units="degrees_north"
   diff3&LON@units="degrees_east"
   diff4&LAT@units="degrees_north"
   diff4&LON@units="degrees_east"
   diff5&latitude@units="degrees_north"
   diff5&longitude@units="degrees_east"
   diff6&latitude@units="degrees_north"
   diff6&longitude@units="degrees_east"
   diff7&LATITUDE@units="degrees_north"
   diff7&LONGITUDE@units="degrees_east"
   diff8&LATITUDE@units="degrees_north"
   diff8&LONGITUDE@units="degrees_east"
   diff9&latitude@units="degrees_north"
   diff9&longitude@units="degrees_east"
   diff10&latitude@units="degrees_north"
   diff10&longitude@units="degrees_east"

   diff_sig1= mask(diff1,(ttest_Abs1.ge.95),True)  
   diff_sig2= mask(diff2,(ttest_Abs2.ge.95),True)   
   diff_sig3= mask(diff3,(ttest_Abs3.ge.95),True)   
   diff_sig4= mask(diff4,(ttest_Abs4.ge.95),True)   
   diff_sig5= mask(diff5,(ttest_Abs5.ge.95),True)  
   diff_sig6= mask(diff6,(ttest_Abs6.ge.95),True)   
   diff_sig7= mask(diff7,(ttest_Abs7.ge.95),True)   
   diff_sig8= mask(diff8,(ttest_Abs8.ge.95),True)   
   diff_sig9= mask(diff9,(ttest_Abs9.ge.95),True)   
   diff_sig10= mask(diff10,(ttest_Abs10.ge.95),True)   

copy_VarCoords(diff1,diff_sig1)
copy_VarCoords(diff2,diff_sig2)
copy_VarCoords(diff3,diff_sig3)
copy_VarCoords(diff4,diff_sig4)
copy_VarCoords(diff5,diff_sig5)
copy_VarCoords(diff6,diff_sig6)
copy_VarCoords(diff7,diff_sig7)
copy_VarCoords(diff8,diff_sig8) 
copy_VarCoords(diff9,diff_sig9) 
copy_VarCoords(diff10,diff_sig10) 
;_______________________________________________________________________

  gsn_define_colormap(wks,"cmp_b2r") ;

  cnres                             = True
  cnres@gsnMaximize                 = False
  ;cnres@cnFillDrawOrder             = "PreDraw"       ; draw contours before continents
  cnres@gsnDraw                     = False
  cnres@gsnFrame                    = False     
  cnres@cnLinesOn                   = False
  cnres@cnLineThicknessF            = 0.5
  cnres@cnLineLabelsOn              = False         
  cnres@cnFillOn                    = True

  ;cnres@mpFillOn                    = False
  ;cnres@mpGeophysicalLineColor      = "black"
  ;cnres@mpGeophysicalLineThicknessF = 1
  ;cnres@mpLandFillColor             = "cornsilk" ;"black"      ;darkolivegreen ;goldenrod4
  ;cnres@mpLandFillPattern           = 4 
  cnres@gsnAddCyclic                = False  
  cnres@mpLimitMode                 = "LatLon"		    
  cnres@mpMinLatF                   = 0		  
  cnres@mpMaxLatF                   = 22
  cnres@mpMinLonF                   = 60			   
  cnres@mpMaxLonF                   = 100              
  ;cnres@cnLevelSelectionMode        = "ManualLevels"
  ;cnres@cnMinLevelValF              = -10
  ;cnres@cnMaxLevelValF              = 10
  ;cnres@cnLevelSpacingF             = 1
  cnres@gsnRightString              = ""
  cnres@gsnLeftString               = "" 
  cnres@tiMainString                = "" ; 
  cnres@tiMainFont                  = "times-roman"
  cnres@lbLabelBarOn                = False            ; turn off individual cb's 
  cnres@lbBoxEndCapStyle            = "TriangleBothEnds"  
  ;cnres@lbBoxEndCapStyle           = "TriangleHighEnd" 
  cnres@pmLabelBarWidthF            = 0.04                                          
  cnres@pmLabelBarHeightF           = 0.23 
  cnres@lbOrientation              = "Vertical"     ; vertical label bar

  cnres@pmTickMarkDisplayMode = "Always"            ; turn on built-in tickmarks


  cnres@lbLabelStride            = 2
  ;cnres@lbTitleOn          = True
  ;cnres@lbTitleString      = "10~S~-6" ;"kJ/cm^2"
  ;cnres@lbTitleFontHeightF = 0.015
  ;cnres@lbTitleFont        = "times-roman" 

  cnres@tmXBLabelFontHeightF    = 0.012    ; Make these labels smaller. 
  cnres@tmYLLabelFontHeightF    = 0.012    ; Make these labels smaller. 
  ;cnres@tmXTOn               = False       ; Turn off top tickmarks
  ;cnres@tmYROn               = False      ; Turn off left tickmarks
  ;cnres@tmYROn               = True      ; Turn off bottom tickmarks

  ;cnres@gsnLeftString        = ""  
  ;cnres@gsnLeftStringFontHeightF = 0.013

  cnres@tmXBLabelFontHeightF    = 0.035    ; Make these labels smaller.
  cnres@tmYLLabelFontHeightF    = 0.035   ; Make these labels smaller.


  cnres@tiYAxisFont 	     = "times-roman"
  cnres@tiXAxisFont          = "times-roman"


  
   cnres@tmXBMajorLengthF     = 0.025
   cnres@tmYLMajorLengthF     = 0.025


  cnres@tmYLLabelFont                  = "times-roman"
  cnres@tmXBLabelFont                  = "times-roman"
  cnres@tmXBLabelsOn                   = True



  cnres@tmYRLabelsOn = True
  cnres@tmXBMajorLengthF=0.03
  cnres@tmYRMajorLengthF=0.03
  ;cnres@tmXBOn               = True     ; Turn off top tickmarks
  ;cnres@tmXTOn               = False     ; Turn off top tickmarks
  ;cnres@tmYLOn               = False     ; Turn off left tickmarks
  ;cnres@tmYROn               = True      ; Turn off bottom tickmarks



  ;cnres@gsnLeftString        = ""
  ;cnres@gsnLeftStringFontHeightF = 0.019


  ;cnres@gsnZonalMean                = True         ; add zonal plot
  ;cnres@gsnZonalMeanXMinF           = -1.          ; set minimum X-axis value for zonal mean plot  
  ;cnres@gsnZonalMeanXMaxF           = 1.           ; set maximum X-axis value for zonal mean plot  
  ;cnres@gsnZonalMeanYRefLine        = 0.0          ; set reference line X-axis value


  cnres_SST                             = cnres
  cnres_SST@cnLevelSelectionMode        = "ManualLevels"
  cnres_SST@cnMinLevelValF              = -0.4
  cnres_SST@cnMaxLevelValF              = 0.4
  cnres_SST@cnLevelSpacingF             = 0.05
 
 


  cnres_RH                             = cnres
  cnres_RH@cnLevelSelectionMode        = "ManualLevels"
  cnres_RH@cnMinLevelValF              = -10
  cnres_RH@cnMaxLevelValF              = 10
  cnres_RH@cnLevelSpacingF             = 1

  cnres_VWS                             = cnres
  cnres_VWS@cnLevelSelectionMode        = "ManualLevels"
  cnres_VWS@cnMinLevelValF              = -10
  cnres_VWS@cnMaxLevelValF              = 10
  cnres_VWS@cnLevelSpacingF             = 1

  cnres_RVORT                             = cnres
  cnres_RVORT@cnLevelSelectionMode        = "ManualLevels"
  cnres_RVORT@cnMinLevelValF              = -3.5
  cnres_RVORT@cnMaxLevelValF              = 3.5
  cnres_RVORT@cnLevelSpacingF             = 0.5

  cnres_TCHP                             = cnres
  cnres_TCHP@cnLevelSelectionMode        = "ManualLevels"
  cnres_TCHP@cnMinLevelValF              = -20.0
  cnres_TCHP@cnMaxLevelValF              = 20.0
  cnres_TCHP@cnLevelSpacingF             = 5.0 
 
;_______________________________________________________________________________
plot1    = new(2,graphic)                             ; create graphics array
  plot1(0) = gsn_csm_contour_map_ce(wks,diff1,cnres_SST) 
  plot1(1) = gsn_csm_contour_map_ce(wks,diff2,cnres_SST) 

plot2    = new(2,graphic)                             ; create graphics array
  plot2(0) = gsn_csm_contour_map_ce(wks,diff3,cnres_TCHP) 
  plot2(1) = gsn_csm_contour_map_ce(wks,diff4,cnres_TCHP)

plot3    = new(2,graphic)                             ; create graphics array
  plot3(0) = gsn_csm_contour_map_ce(wks,diff5,cnres_RH) 
  plot3(1) = gsn_csm_contour_map_ce(wks,diff6,cnres_RH) 

plot4    = new(2,graphic)                             ; create graphics array
  plot4(0) = gsn_csm_contour_map_ce(wks,diff7,cnres_VWS) 
  plot4(1) = gsn_csm_contour_map_ce(wks,diff8,cnres_VWS)

plot5    = new(2,graphic)                             ; create graphics array
  plot5(0) = gsn_csm_contour_map_ce(wks,diff9,cnres_RVORT) 
  plot5(1) = gsn_csm_contour_map_ce(wks,diff10,cnres_RVORT)




;------------------------------
; plot statistical significance
;------------------------------

  sgres                      = True		; significance
  sgres@gsnDraw              = False		; draw plot
  sgres@gsnFrame             = False		; advance frome
  sgres@cnInfoLabelOn        = False		; turn off info label
  sgres@cnLinesOn            = False		; draw contour lines
  sgres@cnLineLabelsOn       = False		; draw contour labels
  sgres@cnFillScaleF         = 0.7		; add extra density
  sgres@cnFillDotSizeF       = 0.002

  sgres@gsnAddCyclic         = False

; activate if gray shading for B&W plot  
  sgres@cnFillOn             = True
  sgres@cnFillColors         = (/"transparent","transparent"/) ; choose one color for our single cn level
  sgres@cnLevelSelectionMode = "ExplicitLevels"	         ; set explicit contour levels
  sgres@cnLevels             = 95.0                            ; only set one level
  sgres@lbLabelBarOn         = False

  sgres@tiMainString         = ""     ; title
  sgres@gsnCenterString      = ""  ; subtitle
  sgres@gsnLeftString        = ""    ; upper-left subtitle
  sgres@gsnRightString       = ""   ; upper-right subtitle

  sig_plot1_0 = gsn_csm_contour(wks,ttest_Abs1,sgres)
  sig_plot1_1 = gsn_csm_contour(wks,ttest_Abs2,sgres)
  sig_plot2_0 = gsn_csm_contour(wks,ttest_Abs3,sgres)
  sig_plot2_1 = gsn_csm_contour(wks,ttest_Abs4,sgres)
  sig_plot3_0 = gsn_csm_contour(wks,ttest_Abs5,sgres)
  sig_plot3_1 = gsn_csm_contour(wks,ttest_Abs6,sgres)
  sig_plot4_0 = gsn_csm_contour(wks,ttest_Abs7,sgres)
  sig_plot4_1 = gsn_csm_contour(wks,ttest_Abs8,sgres)
  sig_plot5_0 = gsn_csm_contour(wks,ttest_Abs9,sgres)
  sig_plot5_1 = gsn_csm_contour(wks,ttest_Abs10,sgres)

  opt                  = True
  opt@gsnShadeFillType = "pattern"
  opt@gsnShadeHigh     = 17
  
  sig_plot1_0 = gsn_contour_shade(sig_plot1_0,-999.,95.0,opt)
  sig_plot1_1 = gsn_contour_shade(sig_plot1_1,-999.,95.0,opt)
  sig_plot2_0 = gsn_contour_shade(sig_plot2_0,-999.,95.0,opt)
  sig_plot2_1 = gsn_contour_shade(sig_plot2_1,-999.,95.0,opt)
  sig_plot3_0 = gsn_contour_shade(sig_plot3_0,-999.,95.0,opt)
  sig_plot3_1 = gsn_contour_shade(sig_plot3_1,-999.,95.0,opt)
  sig_plot4_0 = gsn_contour_shade(sig_plot4_0,-999.,95.0,opt)
  sig_plot4_1 = gsn_contour_shade(sig_plot4_1,-999.,95.0,opt) 
  sig_plot5_0 = gsn_contour_shade(sig_plot5_0,-999.,95.0,opt)
  sig_plot5_1 = gsn_contour_shade(sig_plot5_1,-999.,95.0,opt)
  

  overlay(plot1(0),sig_plot1_0)
  overlay(plot1(1),sig_plot1_1)
  overlay(plot2(0),sig_plot2_0)
  overlay(plot2(1),sig_plot2_1)
  overlay(plot3(0),sig_plot3_0)
  overlay(plot3(1),sig_plot3_1)
  overlay(plot4(0),sig_plot4_0)
  overlay(plot4(1),sig_plot4_1)
  overlay(plot5(0),sig_plot5_0)
  overlay(plot5(1),sig_plot5_1)
 

;__________________________________________________________________
  
  ;---Equator line
  lnresq                   = True
  lnresq@gsLineColor       = "black" 
  lnresq@gsLineThicknessF  = 2.0    
  lnresq@gsLineDashPattern = 1
  lonboxq = (/ 0, 180, 180, 0, 0/)
  latboxq = (/0,0,0,0,0/)

  EQLINE11    = gsn_add_polyline(wks,plot1(0),lonboxq,latboxq,lnresq)
  EQLINE12    = gsn_add_polyline(wks,plot1(1),lonboxq,latboxq,lnresq)

;---------------------------------------------------------
gres                  = True
gres@gsnDraw          = False
gres@gsnFrame         = False   
gres@gsLineColor       = "Blue"   ; Polyline resources.
gres@gsLineThicknessF  = 1.0      ; thrice thickness
gres@gsFillColor       = "Red"    ; Polygon resources.
gres@gsFillIndex       = -1
;gres@gsFillOpacityF    = 2
gres@gsEdgesOn         = True     ; Line will be drawn around polygon.
gres@gsEdgeColor       = "black"
gres@gsEdgeThicknessF  = 1
gres@gsMarkerIndex     = 16       ; dots   # Polymarker resources.
gres@gsMarkerColor     = "HotPink"
gres@gsMarkerSizeF     = 0.014    ; twice normal size

xsquare = (/83.0,95.0,95.0,83.0,83.0/)    ; X and Y coordinates
ysquare = (/5,5, 10, 10, 5/)    ; for polygon.

Box11  = gsn_add_polygon(wks,plot1(0),xsquare,ysquare,gres)
Box12  = gsn_add_polygon(wks,plot1(1),xsquare,ysquare,gres)
Box21  = gsn_add_polygon(wks,plot2(0),xsquare,ysquare,gres)
Box22  = gsn_add_polygon(wks,plot2(1),xsquare,ysquare,gres)
Box31  = gsn_add_polygon(wks,plot3(0),xsquare,ysquare,gres)
Box32  = gsn_add_polygon(wks,plot3(1),xsquare,ysquare,gres)
Box41  = gsn_add_polygon(wks,plot4(0),xsquare,ysquare,gres)
Box42  = gsn_add_polygon(wks,plot4(1),xsquare,ysquare,gres)
Box51  = gsn_add_polygon(wks,plot5(0),xsquare,ysquare,gres)
Box52  = gsn_add_polygon(wks,plot5(1),xsquare,ysquare,gres)
;---------------------------------------------------------

;----------------------------------------------------------------------
; Draw lines at the lon/lon coordinate array values.
;----------------------------------------------------------------------
  pres                   = True
  ;pres@gsnDraw           = False
  ;pres@gsnFrame          = False 
  pres@gsnCoordsAsLines  = False 
  pres@gsnCoordsAttach    = True 
  pres@gsLineThicknessF  = 2
  ;gsn_coordinates(wks,plot1,diff_sig,pres)
  ;delete(pres@gsnCoordsAsLines)

;----------------------------------------------------------------------
; Draw the lat/lon grid with markers, using black for grid locations
; where the data is not missing, and red for grid locations
; where the data is missing.
;---------------------------------------------------------------------
  pres@gsnCoordsNonMissingColor = "black"
  pres@gsnCoordsMissingColor    = "transparent"
  pres@gsMarkerSizeF            = 0.0005     ;   0.0001
  ;gsn_coordinates(wks,plot1(0),diff_sig1,pres)
  ;gsn_coordinates(wks,plot1(1),diff_sig2,pres)
  ;gsn_coordinates(wks,plot2(0),diff_sig3,pres)
  ;gsn_coordinates(wks,plot2(1),diff_sig4,pres)
  ;gsn_coordinates(wks,plot3(0),diff_sig5,pres)
  ;gsn_coordinates(wks,plot3(1),diff_sig6,pres)
  ;gsn_coordinates(wks,plot4(0),diff_sig7,pres)
  ;gsn_coordinates(wks,plot4(1),diff_sig8,pres)
  ;gsn_coordinates(wks,plot5(0),diff_sig9,pres)
  ;gsn_coordinates(wks,plot5(1),diff_sig10,pres)
;----------------------------------------------------------------------
; Draw both plots in one panel.
;----------------------------------------------------------------------
  ppres                     = True
  ppres@gsnMaximize         = True
  ;ppres@gsnPanelMainString  = "WRF output data - " + tc@description + " (" + tc@units + ")"
  ppres@gsnPanelLabelBar    = True
  ppres@gsnPanelRowSpec     = True
  ppres@pmLabelBarWidthF    = 0.7


  resP                  	        = True                   	                ; modify the panel plot
  resP@gsnFrame                         = True                   	                ; don't advance panel plot
  resP@gsnPanelLabelBar 	        = True       

  resP@gsnPanelLabelBar 	        = True                   	                ; add common colorbar
  resP@lbBoxEndCapStyle                 = "TriangleBothEnds"

  resP@gsnPanelLabelBar          = True                ; add common colorbar
  resP@lbLabelFontHeightF        = 0.006               ; make labels smaller
  resP@lbLabelFont               = "times-roman"
  ;resP@lbTitleOn                 = True
  resP@lbLabelStride             = 2
  ;resP@lbTitleString             = "mm ~NN~ day~S~-1" ;"kJ/cm^2"
  ;resP@lbTitleFontHeightF        = 0.008
  ;resP@lbTitleFont               = "times-roman"
  ;resP@lbTitlePosition           = "Bottom"
  ;resP@pmLabelBarOrthogonalPosF  = -0.1
  resP@pmLabelBarWidthF            = 0.04                                         
  resP@pmLabelBarHeightF           = 0.15 
  resP@lbOrientation              = "Vertical"     ; vertical label bar
  resP@gsnPanelFigureStringsFont = "times-roman"
  ;resP@gsnPanelBottom            = 0.05                 ; add space at bottom


  resP@pmLabelBarOrthogonalPosF = .01
  ;resP@pmLabelBarParallelPosF = .04
  resP@lbLabelFontHeightF  = 0.015     ; make labels smaller
  resP@lbTitleFontHeightF   =0.015



  ;resP@gsnPanelRowSpec                  = True                                          ; tell panel what order to plt

  resP@amJust   		        = "TopLeft"
  resP@gsnPanelFigureStringsFontHeightF = 0.009
  resP@gsnPanelFigureStringsBackgroundFillColor = "aliceblue"
  resP@gsnPanelFigureStringsFont        = "times-roman"

  ;gsn_panel(wks,(/plot1,plot2,plot3,plot4/),(/2,2/),resP)



  MAXIMIZE_OUTPUT           = True                  ; if maximization of plots is desired.


  resP1                       = resP
  resP1@gsnPanelFigureStrings = (/"(a) Sea surface temperature (Positive IOD)","(b) Sea surface temperature (Negative IOD)"/)
; we use PanelBottom to tell the plot to only draw in the top part of the page.
; since there are two plots here, and we have limited the plot to the upper
; 0.6 of the page, each plot will have a size 0.3.
  resP1@gsnPanelBottom      = 0.8        ; move bottom up from 0.0 to 0.4

  ;resP1@gsnPanelRight       = 1.0
                 	          
 

  resP1@gsnFrame            = False      ; don't advance frame yet
  gsn_panel(wks,plot1,(/1,2/),resP1)                                   ; now draw as one plot

  resP2                       = resP
  resP2@gsnPanelFigureStrings = (/"(c) TCHP (Positive IOD)","(d) TCHP (Negative IOD)"/)
  resP2@gsnPanelTop         = 0.8        ; draw up to the bdry of upper plot
  resP2@gsnPanelBottom      = 0.6        ; move bottom up so size is 0.3
  resP2@gsnFrame            = False      ; don't advance frame yet


  gsn_panel(wks,plot2,(/1,2/),resP2) 
 
  resP3                       = resP
  resP3@gsnPanelFigureStrings = (/"(e) Relative humidity (Positive IOD)","(f) Relative humidity (Negative IOD)"/)
  resP3@gsnPanelTop         = 0.6        ; draw up to the bdry of upper plot
  resP3@gsnPanelBottom      = 0.4        ; move bottom up so size is 0.3
  resP3@gsnFrame            = False      ; don't advance frame yet


  gsn_panel(wks,plot3,(/1,2/),resP3) 

  resP4                       = resP
  resP4@gsnPanelFigureStrings = (/"(g) Vertical wind shear (Positive IOD)","(h) Vertical wind shear (Negative IOD)"/)
  resP4@gsnPanelTop         = 0.4        ; draw up to the bdry of upper plot
  resP4@gsnPanelBottom      = 0.2        ; move bottom up so size is 0.3
  resP4@gsnFrame            = False      ; don't advance frame yet


  gsn_panel(wks,plot4,(/1,2/),resP4) 

  resP5                       = resP
  resP5@gsnPanelFigureStrings = (/"(i) Relative vorticity (Positive IOD)","(j) Relative vorticity (Negative IOD)"/)
  resP5@gsnPanelTop         = 0.2        ; draw up to the bdry of upper plot
  resP5@gsnPanelBottom      = 0.0        ; move bottom up so size is 0.3
  resP5@gsnFrame            = False      ; don't advance frame yet

  gsn_panel(wks,plot5,(/1,2/),resP5) 

  ;draw(plot)
  frame(wks)     

 
  delete(wks)

  cmd = "convert -geometry 2500x2500 -density 300 -trim " + pname + ".eps " + \
                                                          pname + ".png"
  system(cmd)

end
