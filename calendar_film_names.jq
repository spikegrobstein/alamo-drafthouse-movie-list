#.Calendar.Cinemas
#  | map(.Months)
#  | map(.[])
#  | map(.Weeks)
#  | map(.[])
#  | map(.Days)
#  | map(.[])
#  | .[]
#  | select(.Films)
#  | map(.Films)

.Calendar.Cinemas[].Months[].Weeks[].Days[]
  | select(.Films)
  | .Films[].FilmName
