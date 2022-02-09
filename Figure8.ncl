load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"   
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_csm.ncl"   
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"
begin



; Main code
;----------------------------------------------------------------------
 
;---Recreating jpeg images only works for X11 and PNG.
   wks_type = "png"
   wks_type@wkWidth = 2500
   wks_type@wkHeight = 2500 
   pname ="ENSO_IOD_Anom_850UV"
   wks = gsn_open_wks("eps",pname)



;---Southern part of Africa
  minlat = -10
  maxlat =  20
  minlon = 65
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


 
  res@tmXBLabelFontHeightF    = 0.02    ; Make these labels smaller.
  res@tmYLLabelFontHeightF    = 0.02   ; Make these labels smaller.
  res@tiYAxisFont 	        = "times-roman"
  res@tiXAxisFont             = "times-roman"

  res@tmXBMajorLengthF        = 0.01
  res@tmYLMajorLengthF        = 0.01

  res@tmYLLabelFont           = "times-roman"
  res@tmXBLabelFont           = "times-roman"
  res@tmXBLabelsOn            = True

  res@tmYRLabelsOn = True
  res@tmXBMajorLengthF=0.015
  res@tmYRMajorLengthF=0.015
  ;res@tmXBOn               = True     ; Turn off top tickmarks
  ;res@tmXTOn               = False     ; Turn off top tickmarks
  ;res@tmYLOn               = False     ; Turn off left tickmarks
  ;res@tmYROn               = True      ; Turn off bottom tickmarks


;_______________________________________________________________________________

  plot = new(4,graphic)                       ; create a plot array

plot(0) = gsn_csm_map(wks,res)  
plot(1) = gsn_csm_map(wks,res)        
plot(2) = gsn_csm_map(wks,res)  
plot(3) = gsn_csm_map(wks,res)
;_______________________________________________________________________________________________________
  fu_ELNINO = addfile("./LLC_Part2/ENSO_composite/New/ElNino/Anom_ELNINO_U850_1979_2020.nc","r")
  fv_ELNINO = addfile("./LLC_Part2/ENSO_composite/New/ElNino/Anom_ELNINO_V850_1979_2020.nc","r")

  print(fu_ELNINO)
  u_ELNINO=fu_ELNINO->change(:,:)
  v_ELNINO=fv_ELNINO->change(:,:)
 
  
  wspd_ELNINO  = wind_speed(u_ELNINO,v_ELNINO)

  u_alpha_ELNINO=fu_ELNINO->alpha(:,:)
  v_alpha_ELNINO=fv_ELNINO->alpha(:,:)
  
 
   copy_VarMeta(u_ELNINO,u_alpha_ELNINO)
   copy_VarMeta(v_ELNINO,v_alpha_ELNINO)

;-------------------------------------
  u_sigu_ELNINO=where(u_alpha_ELNINO.ge.95,u_ELNINO,u_ELNINO@_FillValue)
  v_sigu_ELNINO=where(u_alpha_ELNINO.ge.95,v_ELNINO,v_ELNINO@_FillValue) 


  u_sigv_ELNINO=where(v_alpha_ELNINO.ge.95,u_ELNINO,u_ELNINO@_FillValue)
  v_sigv_ELNINO=where(v_alpha_ELNINO.ge.95,v_ELNINO,v_ELNINO@_FillValue) 


   copy_VarMeta(u_ELNINO,u_sigu_ELNINO)
   copy_VarMeta(v_ELNINO,v_sigu_ELNINO)
   
   copy_VarMeta(u_ELNINO,u_sigv_ELNINO)
   copy_VarMeta(v_ELNINO,v_sigv_ELNINO)
;_______________________________________________________________________________________________________
  fu_LANINA = addfile("./LLC_Part2/ENSO_composite/New/LaNina/Anom_LANINA_U850_1979_2020.nc","r")
  fv_LANINA = addfile("./LLC_Part2/ENSO_composite/New/LaNina/Anom_LANINA_V850_1979_2020.nc","r")

  print(fu_LANINA)
  u_LANINA=fu_LANINA->change(:,:)
  v_LANINA=fv_LANINA->change(:,:)
 
  
  wspd_LANINA  = wind_speed(u_LANINA,v_LANINA)

  u_alpha_LANINA=fu_LANINA->alpha(:,:)
  v_alpha_LANINA=fv_LANINA->alpha(:,:)
  
 
   copy_VarMeta(u_LANINA,u_alpha_LANINA)
   copy_VarMeta(v_LANINA,v_alpha_LANINA)

;-------------------------------------
  u_sigu_LANINA=where(u_alpha_LANINA.ge.95,u_LANINA,u_LANINA@_FillValue)
  v_sigu_LANINA=where(u_alpha_LANINA.ge.95,v_LANINA,v_LANINA@_FillValue) 


  u_sigv_LANINA=where(v_alpha_LANINA.ge.95,u_LANINA,u_LANINA@_FillValue)
  v_sigv_LANINA=where(v_alpha_LANINA.ge.95,v_LANINA,v_LANINA@_FillValue) 


   copy_VarMeta(u_LANINA,u_sigu_LANINA)
   copy_VarMeta(v_LANINA,v_sigu_LANINA)
   
   copy_VarMeta(u_LANINA,u_sigv_LANINA)
   copy_VarMeta(v_LANINA,v_sigv_LANINA)
 
;_________________________________________________________________________________
  fu_PIOD = addfile("./LLC_Part2/IOD_composite/New/PIOD/Anom_PIOD_U850_1979_2020.nc","r")
  fv_PIOD = addfile("./LLC_Part2/IOD_composite/New/PIOD/Anom_PIOD_V850_1979_2020.nc","r")

  print(fu_PIOD)
  u_PIOD=fu_PIOD->change(:,:)
  v_PIOD=fv_PIOD->change(:,:)
 
  
  wspd_PIOD  = wind_speed(u_PIOD,v_PIOD)

  u_alpha_PIOD=fu_PIOD->alpha(:,:)
  v_alpha_PIOD=fv_PIOD->alpha(:,:)
  
 
   copy_VarMeta(u_PIOD,u_alpha_PIOD)
   copy_VarMeta(v_PIOD,v_alpha_PIOD)

;-------------------------------------
  u_sigu_PIOD=where(u_alpha_PIOD.ge.95,u_PIOD,u_PIOD@_FillValue)
  v_sigu_PIOD=where(u_alpha_PIOD.ge.95,v_PIOD,v_PIOD@_FillValue) 


  u_sigv_PIOD=where(v_alpha_PIOD.ge.95,u_PIOD,u_PIOD@_FillValue)
  v_sigv_PIOD=where(v_alpha_PIOD.ge.95,v_PIOD,v_PIOD@_FillValue) 


   copy_VarMeta(u_PIOD,u_sigu_PIOD)
   copy_VarMeta(v_PIOD,v_sigu_PIOD)
   
   copy_VarMeta(u_PIOD,u_sigv_PIOD)
   copy_VarMeta(v_PIOD,v_sigv_PIOD)
;_______________________________________________________________________________________________________
  fu_NIOD = addfile("./LLC_Part2/IOD_composite/New/NIOD/Anom_NIOD_U850_1979_2020.nc","r")
  fv_NIOD = addfile("./LLC_Part2/IOD_composite/New/NIOD/Anom_NIOD_V850_1979_2020.nc","r")

  print(fu_NIOD)
  u_NIOD=fu_NIOD->change(:,:)
  v_NIOD=fv_NIOD->change(:,:)
 
  
  wspd_NIOD  = wind_speed(u_NIOD,v_NIOD)

  u_alpha_NIOD=fu_NIOD->alpha(:,:)
  v_alpha_NIOD=fv_NIOD->alpha(:,:)
  
 
   copy_VarMeta(u_NIOD,u_alpha_NIOD)
   copy_VarMeta(v_NIOD,v_alpha_NIOD)

;-------------------------------------
  u_sigu_NIOD=where(u_alpha_NIOD.ge.95,u_NIOD,u_NIOD@_FillValue)
  v_sigu_NIOD=where(u_alpha_NIOD.ge.95,v_NIOD,v_NIOD@_FillValue) 


  u_sigv_NIOD=where(v_alpha_NIOD.ge.95,u_NIOD,u_NIOD@_FillValue)
  v_sigv_NIOD=where(v_alpha_NIOD.ge.95,v_NIOD,v_NIOD@_FillValue) 


   copy_VarMeta(u_NIOD,u_sigu_NIOD)
   copy_VarMeta(v_NIOD,v_sigu_NIOD)
   
   copy_VarMeta(u_NIOD,u_sigv_NIOD)
   copy_VarMeta(v_NIOD,v_sigv_NIOD)
;_______________________________________________________________________________________________________


  cmap = read_colormap_file("wh-bl-gr-ye-re")

  vcres                         = True
  vcres@gsnDraw                 = False
  vcres@gsnFrame                = False

  ;vcres@sfXCStartV = 40 
  ;vcres@sfXCEndV   = 100 
  ;vcres@sfYCStartV = -20 
  ;vcres@sfYCEndV   = 20 



  vcres@mpLimitMode                 = "LatLon"		    
  vcres@mpMinLatF                   = -20		  
  vcres@mpMaxLatF                   = 20
  vcres@mpMinLonF                   = 40			   
  vcres@mpMaxLonF                   = 110    

  ;vcres@vcLineArrowThicknessF     =   0.5                         ;-- make vector lines thicker (default: 1.0)
  vcres@vcRefMagnitudeF           = 2.5             ; define vector ref mag
  vcres@vcRefLengthF              = 0.02            ; define length of vec ref
  vcres@vcMinFracLengthF          = 0.3
  vcres@vcMinDistanceF            = 0.02
  vcres@vcRefAnnoOrthogonalPosF   = -0.14
  vcres@vcRefAnnoFontHeightF      = 0.012
  vcres@vcRefAnnoString2On        = False 
  ;vcres@vcGlyphStyle             = "CurlyVector"     ; turn on curly vectors
  vcres@vcLineArrowThicknessF     = 2.0               ; change vector thickness
  vcres@gsnRightString            = ""
  vcres@gsnLeftString             = " "
  vcres@vcRefAnnoArrowUseVecColor = False           ; don't use vec color for ref
  vcres@vcVectorDrawOrder         = "PreDraw" ; draw order 
  vcres@vcFillArrowsOn            = True
  ;vcres@vcFillArrowFillColor     = "tomato4"
  vcres@vcMonoFillArrowFillColor = False     ; Color according to magnitude
 
  vcres@vcLevelPalette           = cmap(6:193,:)
  vcres@vcLevelSelectionMode	 = "ManualLevels"
  vcres@vcMinLevelValF           = 0.0
  vcres@vcMaxLevelValF           = 2.5
  vcres@vcLevelSpacingF          = 0.1

  vcres@lbLabelBarOn              = False          ; turn off individual cb's 
  vcres@lbOrientation             = "Vertical"
  ;vcres@lbBoxEndCapStyle         = "TriangleBothEnds" 
  vcres@lbBoxEndCapStyle          = "TriangleHighEnd" 
  ;vcres@lbLabelFont               = "times_roman"                              ; label font
  vcres@lbLabelFontHeightF        = 0.011  
  vcres@lbLabelStride             = 2             
  vcres@pmLabelBarWidthF          = 0.08                                          
  vcres@pmLabelBarHeightF         = 0.4

  vcres@tmXBLabelFontHeightF    = 0.05    ; Make these labels smaller.
  vcres@tmYLLabelFontHeightF    = 0.03   ; Make these labels smaller.
  vcres@tiYAxisFont 	        = "times-roman"
  vcres@tiXAxisFont             = "times-roman"

  vcres@tmXBMajorLengthF        = 0.03
  vcres@tmYLMajorLengthF        = 0.04

  vcres@tmYLLabelFont           = "times-roman"
  vcres@tmXBLabelFont           = "times-roman"
  vcres@tmXBLabelsOn            = True

  ;vcres@tmYRLabelsOn = True
  ;vcres@tmXBMajorLengthF=0.015
  ;vcres@tmYRMajorLengthF=0.015
  ;vcres@tmXBOn               = True     ; Turn off top tickmarks
  ;vcres@tmXTOn               = False     ; Turn off top tickmarks
  ;vcres@tmYLOn               = False     ; Turn off left tickmarks
  ;vcres@tmYROn               = True      ; Turn off bottom tickmarks


;---Set GSN resources
  vcres2                         = True             ; plot mods desired
  vcres2@gsnDraw                 = False
  vcres2@gsnFrame                = False            ; so we can draw time stamp
  vcres2@gsnMaximize             = False


  vcres2@vcVectorDrawOrder       = "PostDraw"        ; draw vectors last

  vcres2@mpLandFillColor         = "gray"              ; set land to be gray


  vcres2@vcRefMagnitudeF         = 2.5             ; define vector ref mag
  vcres2@vcRefLengthF            = 0.04            ; define length of vec ref

  vcres2@vcRefAnnoOrthogonalPosF   = -0.14
  vcres2@vcRefAnnoFontHeightF      = 0.02
  vcres2@vcRefAnnoString2On        = False 
  vcres2@vcGlyphStyle              = "CurlyVector"    ; turn on curly vectors
  vcres2@vcMinDistanceF            = 0.04

;---Set up some vector resources.

  vcres2@vcLevelPalette           = cmap(6:193,:)
  vcres2@vcLevelSelectionMode	 = "ManualLevels"
  vcres2@vcMinLevelValF           = 0.0
  vcres2@vcMaxLevelValF           = 2.5
  vcres2@vcLevelSpacingF          = 0.1

  ;vcres2@vcLevelPalette           = "cmocean_matter"   ; assign color map to vectors WhiteBlueGreenYellowRed

  vcres2@lbLabelBarOn                = False           ; turn off individual cb's 
  ;vcres2@lbBoxEndCapStyle            = "TriangleBothEnds"  
  ;vcres2@lbBoxEndCapStyle           = "TriangleHighEnd" 
  ;vcres2@pmLabelBarWidthF            = 0.4                                          
  ;vcres2@pmLabelBarHeightF           = 0.045 
  ;vcres2@lbOrientation              = "Vertical"     ; vertical label bar
  ;vcres2@pmLabelBarOrthogonalPosF    = 0.19          ; move label bar closer
  ;vcres2@lbLabelFont                 = "times-roman"


  vcres2@vcFillArrowsOn           = True
  vcres2@vcLineArrowThicknessF    =  2.5
  ;vcres2@vcRefLengthF             = 0.045
  ;vcres2@vcRefMagnitudeF          = 0.5
  ;vcres2@vcRefAnnoOrthogonalPosF  = -0.12
  ;vcres2@vcRefAnnoParallelPosF    =  0.997
  ;vcres2@vcRefAnnoFontHeightF     = 0.015

  ;vcres2@vcMinFracLengthF         = 0.33
  ;vcres2@vcMinMagnitudeF          = 0.001
  vcres2@vcMonoFillArrowFillColor = False
  vcres2@vcMonoLineArrowColor     = False

  vcres2@gsnLeftString        = ""  
  vcres2@gsnRightString        = ""  
  ;vcres2@gsnLeftStringFontHeightF = 0.013



  


;----------------------------------------------


 uv_rc_plot_sigu_ELNINO  = gsn_csm_vector_scalar(wks,u_sigu_ELNINO,v_sigu_ELNINO,wspd_ELNINO,vcres2)
 uv_rc_plot_sigv_ELNINO  = gsn_csm_vector_scalar(wks,u_sigv_ELNINO,v_sigv_ELNINO,wspd_ELNINO,vcres2)

 uv_rc_plot_sigu_LANINA  = gsn_csm_vector_scalar(wks,u_sigu_LANINA,v_sigu_LANINA,wspd_LANINA,vcres2)
 uv_rc_plot_sigv_LANINA  = gsn_csm_vector_scalar(wks,u_sigv_LANINA,v_sigv_LANINA,wspd_LANINA,vcres2)

 uv_rc_plot_sigu_PIOD  = gsn_csm_vector_scalar(wks,u_sigu_PIOD,v_sigu_PIOD,wspd_PIOD,vcres2)
 uv_rc_plot_sigv_PIOD  = gsn_csm_vector_scalar(wks,u_sigv_PIOD,v_sigv_PIOD,wspd_PIOD,vcres2)
 
 uv_rc_plot_sigu_NIOD  = gsn_csm_vector_scalar(wks,u_sigu_NIOD,v_sigu_NIOD,wspd_NIOD,vcres2)
 uv_rc_plot_sigv_NIOD  = gsn_csm_vector_scalar(wks,u_sigv_NIOD,v_sigv_NIOD,wspd_NIOD,vcres2)
 
 
  overlay(plot(0),uv_rc_plot_sigu_ELNINO)
  overlay(plot(0),uv_rc_plot_sigv_ELNINO)

  overlay(plot(1),uv_rc_plot_sigu_LANINA)
  overlay(plot(1),uv_rc_plot_sigv_LANINA)

  overlay(plot(2),uv_rc_plot_sigu_PIOD)
  overlay(plot(2),uv_rc_plot_sigv_PIOD)

  overlay(plot(3),uv_rc_plot_sigu_NIOD)
  overlay(plot(3),uv_rc_plot_sigv_NIOD)
;----------------------------------------------
 


;---Overlay a red box
  lnres                  = True
  lnres@gsLineColor      = "red" ; red box 
  lnres@gsLineThicknessF = 2.0   ; make box thicker
  lnres@gsLineDashPattern = 2

  lonboxb = (/ 50, 90, 90, 50, 50/)
  latboxb = (/-3,-3,2,2,-3/)
  ;box1 = gsn_add_polyline(wks,plot(0),lonboxb,latboxb,lnres)
  ;box2 = gsn_add_polyline(wks,plot(1),lonboxb,latboxb,lnres)
;---Equator line
  lnresq                  = True
  lnresq@gsLineColor      = "blue" 
  lnresq@gsLineThicknessF = 2.0    
  lnresq@gsLineDashPattern = 2
  lonboxq = (/ 0, 180, 180, 0, 0/)
  latboxq = (/0,0,0,0,0/)

  EQLINE0    = gsn_add_polyline(wks,plot(0),lonboxq,latboxq,lnresq)
  EQLINE1    = gsn_add_polyline(wks,plot(1),lonboxq,latboxq,lnresq)
  EQLINE3    = gsn_add_polyline(wks,plot(2),lonboxq,latboxq,lnresq)
  EQLINE4    = gsn_add_polyline(wks,plot(3),lonboxq,latboxq,lnresq)
;************************************************
; create panel
;************************************************

  resP                  	        = True                   	                ; modify the panel plot
  resP@gsnFrame                         = True                   	                ; don't advance panel plot
  resP@gsnPanelLabelBar 	        = True                   	                ; add common colorbar
  resP@lbLabelFont                      = "complex_script"                              ; label font
  resP@lbOrientation             = "Vertical"
  ;resP@lbBoxEndCapStyle         = "TriangleBothEnds" 
  resP@lbBoxEndCapStyle          = "TriangleHighEnd" 
  resP@lbLabelFont               = "times-roman"                              ; label font
  resP@lbLabelFontHeightF        = 0.015  
  resP@lbLabelStride             = 2             
  resP@pmLabelBarWidthF          = 0.08                                          
  resP@pmLabelBarHeightF         = 0.4
 
  ;resP@lbLabelPosition                  = "Center"                                      ; label position
  ;resP@lbLabelAlignment                 = "BoxCenters"                                  ; label orientation
  ;resP@txString         	        = "Composite of Sea Surface Temperature (TMI) (1998-2010)"  ; add common title
  resP@txFont                           = 2 
  resP@txFontHeightF                    = 0.015  
  resP@txFontColor                      = "Brown"
  ;resP@gsnPanelBottom   	        = 0.05                   	                ; add space at bottom
  resP@gsnPanelFigureStrings	        = (/"(a) El Nin~H-13V2F35~D~FV-2H3~o","(b) La Nin~H-13V2F35~D~FV-2H3~a","(c) Positive IOD","(d) Negative IOD"/) 
  resP@gsnPanelFigureStringsFontHeightF = 0.015
  resP@gsnPanelFigureStringsBackgroundFillColor = "aliceblue"
  resP@gsnPanelFigureStringsFont        = "times-roman"
  resP@amJust   		        = "TopLeft"
  resP@gsnPanelRowSpec                  = True                                          ; tell panel what order to plt
  gsn_panel(wks,plot,(/2,2/),resP)         	                                ; now draw as one plot


 
;  txres               = True
;  txres@txFontHeightF = 0.015
;  gsn_text_ndc(wks,"Figure 1: A nifty panel plot",0.5,0.02,txres)
;  frame(wks)







  ;draw(plot)
  ;frame(wks)  

  delete(wks)

  cmd = "convert -geometry 2500x2500 -density 300 -trim " + pname + ".eps " + \
                                                          pname + ".png"
  system(cmd)    

end
