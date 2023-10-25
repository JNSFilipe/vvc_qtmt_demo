function cd = avgCompDelta(Cr,Cm)

    cd = mean((Cm-Cr)./Cr)*100;