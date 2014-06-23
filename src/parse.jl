const identifier = r"(?![!0-9])[^,⊶⩃↣⩄≗≦⥥∓≨⊘×≥≫⥘⪚⋼⭂⥩⩾⥓∝⤞⇼⥍⭈∽⩁⥎⟑⟉∊∷≳≠⩧⫏⇿⬵≬⩗⥭⦾⥖→∪⫑⪀⩠⥢⤌⋝⊕⪪≈⪏≤⨤⪿⟰≼⫂≹⪣⋴≧∸≐⭋∨⨳⭁∺⋥⟽⊷⟱≡\]⤅⪃⩋⩊⋣⋎⥗⨮⬻⪻≢∙⪕⩓⫺∧⧻⨭⊵≓⥬⥛⋿⭃⫒⫕⩡⬺⧷⥄⊱⨰⊇≊⨬≖>⤕⬴⟿⋘⪇≯⋕⤏⟶⥚⥜⨼∥⪠⥝⬷∘⊴⪈⤔⪍⫄?⊰⪌⋩≟⋜⫀\)⫎⩦⋏⫷⊋⪱⤀⩯⤘⫌⩱≜↓⋗↑≛⋌⪢⫖⋖⩰⊏⊗⪡⋆⟈⤂⥆⧁⊻⤋⤖⩹↦⪳⩸⥅∔⨺⋐≶⟵\}⪙⪧⇺%≭≕⥔⥐⊆⋸⅋⋒≃≝≿⇴⩌⋠⇽≰/⫙⊠⪼⇔\[⟾+≩⊟⨶⥰⪉≎≷⩣⭄&⨲⧣⩭≑⊐⫗⩬⩢⬽⪯⪓⪒≪∈⪘⬿⫸⇹⊅⨥⨩≚⋹⊃⊂⪞⋺⨹⋦∦≮⋧⋛⋾⊁≉￪≔±\{⩒⩑⋫￩⥤⨽⬲⪄⫓⪑∩⧡⩮⪟⪛⋽⪦⇒≁⪝⬳⩝⩳≴⪰⟻≣⦼⩷⇶⋳⪺⪜⩕⥦∛≽⋑⤓⟼⩏≲⊲≸⟺⇷⟹∌⩪⊞⫉⨴⪤⪸⥡⩔⭊⪆⩲⫈⥒⫋⬶⫁⪵∗⫊⩖≙⩐≍⨫⦸⋚⊄⫐⥇⥣⪲↔⪷⨈⧺⭌⨨≄⤟^≵⋭⋊⟷⩅∤⫆⊽\(⬸⤒⪾⩞⥫⥙⋙⨱⬹<⊎⤊⤁⇏≺⋵⥏⩴⋶⪂⥕⪨⋇⊊⫅⊖⪶⋬≻⋍⋓⩍≱⇻⩵↮⋋⪖⨢↠⤎⊈⊮⋪⊓⪔\⨧⩜⥞⫇⪫⬾⋷⤃⧥⫃⨷⥈⤄⩼⋤⥠⬼⤠⩛≂↚⥧|∍⨻⊙⨪∋⪋⋲⤍.\"⊑⩟⇎*:￬⭉⤉⥯⬱⇾⋡÷⥟⥋∉⬰≞≾⫍⨵⩚⩫≅⩿⪎⪴⊒⪽≀⫹⤇⋅⩀⊡⤆∜⤈⨣↛⊩⫔⦷⩺≋\-≇⋨⊜~⫛≌⥉√⋢⊛⤗⋟⧶≏⊔⪗⋞ ⩎⊳∾⥨￫⩘⥌⪹⪩⩻=⨸⪊⨇⧤⇸⊉⥑⥮⭀⧀⊚⊬≒\$⊀⋻⦿⭇⥊≆←⤐≘⋉⊼⥪⧴⪅⩽⪬⪁⋄⤑⨦⩶⇵⪥⊍⫘⩂⪐⟒⪭⪮⤝∻\"]+"

const blockopeners = Set(["begin", "function", "type", "immutable",
                         "let", "macro", "for", "while",
                         "quote", "if", "else", "elseif",
                         "try", "finally", "catch", "do",
                         "module"])

const blockclosers = Set(["end", "else", "elseif", "catch", "finally"])

const operators = r"^(?:\.?[|&^\\%*+\-<>!=\/]=?|\?|~|::|:|\$|<:|\.[<>]|<<=?|>>>?=?|\.[<>=]=|->?|\/\/|\bin\b|\.{3}|\.)"

const macros = Regex("@(?:" * identifier.pattern * "\\.?)*")