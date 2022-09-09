library(whitewater)

yaak_river_dv <- ww_dvUSGS('12304500')

#daily
yaak_river_stats <- ww_statsUSGS(yaak_river_dv,
                                 temporalFilter = 'daily',
                                 days = 10)
#monthly
yaak_river_stats <- ww_statsUSGS(yaak_river_dv,
                                 temporalFilter = 'monthly',
                                 days = 10)
#yearly
yaak_river_stats <- ww_statsUSGS(yaak_river_dv,
                                 temporalFilter = 'yearly',
                                 days = 10)