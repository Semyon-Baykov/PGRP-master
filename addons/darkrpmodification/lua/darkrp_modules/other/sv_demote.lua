hook.Add('canDemote', 'GPortalRP_demotefix', function(_,p,r)

        if p:Team() == TEAM_ADMIN or p:Team() == TEAM_MAYOR then
          	DarkRP.notify(_, 1, 10, 'Увольнение данного игрока невозможно')
          return false
        end

end)
