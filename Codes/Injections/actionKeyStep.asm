pushglb.v global.consoleEnabled
conv.v.b
not.b
bf [800]

pushglb.v global.neoconsole_enabled
conv.v.b
not.b
b [801]

:[800]
push.e 0

:[801]
bf [2]

:[1]
push.v self.pressed
conv.v.b
not.b
b [3]