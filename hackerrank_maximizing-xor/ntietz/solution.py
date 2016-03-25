x, y = int(raw_input()), int(raw_input())
print max([a^b for a in range(x,y+1) for b in range(x,y+1)])
