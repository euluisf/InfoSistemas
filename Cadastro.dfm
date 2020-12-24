object FrCadastro: TFrCadastro
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Cadastro'
  ClientHeight = 415
  ClientWidth = 592
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object PBackground: TPanel
    Left = 0
    Top = 0
    Width = 592
    Height = 376
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object LNome: TcxLabel
      Left = 24
      Top = 24
      Caption = 'Nome:'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
    end
    object LIdentidade: TcxLabel
      Left = 24
      Top = 47
      Caption = 'Identidade:'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
    end
    object LCPF: TcxLabel
      Left = 24
      Top = 70
      Caption = 'CPF:'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
    end
    object LTelefone: TcxLabel
      Left = 24
      Top = 93
      Caption = 'Telefone:'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
    end
    object LEmail: TcxLabel
      Left = 26
      Top = 116
      Caption = 'Email:'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
    end
    object EdNome: TcxTextEdit
      Left = 112
      Top = 23
      TabOrder = 0
      Width = 420
    end
    object EdIdentidade: TcxTextEdit
      Left = 112
      Top = 46
      TabOrder = 1
      Width = 121
    end
    object EdEmail: TcxTextEdit
      Left = 112
      Top = 115
      TabOrder = 4
      Width = 420
    end
    object EdCPF: TcxMaskEdit
      Left = 112
      Top = 69
      Properties.EditMask = '999.999.999-99;0;_'
      TabOrder = 2
      Text = '           '
      Width = 121
    end
    object EdTelefone: TcxMaskEdit
      Left = 112
      Top = 92
      Properties.EditMask = '!\(99\)00000-0000;0;_'
      TabOrder = 3
      Text = '           '
      Width = 121
    end
    object cxGroupBox1: TcxGroupBox
      Left = 16
      Top = 147
      Caption = 'Endere'#231'o'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
      TabOrder = 5
      Height = 206
      Width = 545
      object EdCep: TcxMaskEdit
        Left = 96
        Top = 28
        Properties.EditMask = '99.999-999;0;_'
        TabOrder = 0
        Text = '        '
        Width = 121
      end
      object LCEP: TcxLabel
        Left = 10
        Top = 28
        Caption = 'CEP:'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
      end
      object LCidade: TcxLabel
        Left = 10
        Top = 122
        Caption = 'Cidade:'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
      end
      object LBairro: TcxLabel
        Left = 10
        Top = 99
        Caption = 'Bairro:'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
      end
      object LNumero: TcxLabel
        Left = 10
        Top = 76
        Caption = 'Numero:'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
      end
      object LLogradouro: TcxLabel
        Left = 10
        Top = 53
        Caption = 'Logradouro:'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
      end
      object EdLogradouro: TcxTextEdit
        Left = 96
        Top = 52
        TabOrder = 2
        Width = 420
      end
      object EdNumero: TcxTextEdit
        Left = 96
        Top = 75
        TabOrder = 3
        Width = 49
      end
      object EdBairro: TcxTextEdit
        Left = 96
        Top = 98
        TabOrder = 4
        Width = 225
      end
      object LPais: TcxLabel
        Left = 10
        Top = 168
        Caption = 'Pa'#237's:'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
      end
      object LEstado: TcxLabel
        Left = 10
        Top = 145
        Caption = 'Estado:'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
      end
      object EdCidade: TcxTextEdit
        Left = 96
        Top = 121
        TabOrder = 5
        Width = 225
      end
      object EdEstado: TcxTextEdit
        Left = 96
        Top = 144
        TabOrder = 6
        Width = 225
      end
      object EdPais: TcxTextEdit
        Left = 96
        Top = 167
        TabOrder = 7
        Width = 225
      end
      object BtBuscar: TcxButton
        AlignWithMargins = True
        Left = 222
        Top = 25
        Width = 75
        Height = 25
        Caption = '&Buscar'
        OptionsImage.Glyph.SourceDPI = 96
        OptionsImage.Glyph.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          6100000026744558745469746C650046696E643B426172733B526962626F6E3B
          5374616E646172643B536561726368BB659C08000002D149444154785EAD936D
          48936B18C7FF7B369FB5E3CB3C6AEACC66E66C94980AF6C1B74A462FE743E087
          2526299812C519A20B03C98A3AC9D2E8E518519F52222A2789ACF99264C58AD0
          322A848E9BBA6992D95496BACD3DDBF43EF7C62AE9ABFDE1C77D735DF7F5E7BA
          EEFB79788410FC2EF128020A4B09A230AB733FF8454CEDE54EFF7AF8EFC6CD6A
          4DFBA39A069DBDF282565F507A2AD96758A369939EB9D6ABAB6BEA75D55EE9D2
          A9EAEE487D466A4D07FC525FF46F84AAF3DA572F07C7C8F0E814B9DD6A20AA73
          5A0E40485D538F6BE0C3383159BE929B779F90AAFA760300BEEA6CDBCF2E9465
          F5F9FF5CEF21D3338BC43060240DD75BC9D1DA7B04C0969397F464F2CB376234
          5B49F3FD3EA23A7D8F9454DFC8FA3E0E43091286FD59BE4D168B2597070E9717
          939356184DA3D8B1F784D16432C3C97941C0032B12C2EB716085B01500F87E83
          2D698AE820365429A70636BB0B8B4E17161C2E78380F122591F0B8396ABA0CEF
          0A8150148C20FE0ABCCB284ECB514600E031F2F4FDF58A6CB9302E468CD4E418
          A46FDD88785FA1D78D71CB3838B71B3C1E81242A1407F2535176682FC0D9D689
          C2132E0010308C4054989F2547F7D31114553DC4DB8F56ECCE4D839B165A67A6
          C0D1B1A2C422E8FB465158A9C390D981A2821CDAA1BBC46FC0B9BCFCF03021BA
          0CA38854E4A17BC08CED294960593EC6FFD3FF151B17075FBEF38505EBF765A3
          67F013D25393E97D39F900186689B34F8E4DCC4091BB09F3AFFBB13B538A11F3
          17D817E626000C3916178C96092BF6E44961EB7F83FCCC784C4DCF8273DA2D00
          0833373D72B5B9F53912625834AA7642124CD0F2E031E667276E02B0DBAC9F2F
          B5689F214922C0BFD53990867970ABB9034EFBAC06808702B12C43A94EC93B36
          BC2DEF389165161B6365BB6A0044049E6A5D4A56E991949C8A77F2AC32929871
          F0BD44AE2807205AFD2DFC4189A66CA0C450820371040EB18198981242610371
          ACF96F64B046FD0FE22625E3DA6A63E80000000049454E44AE426082}
        TabOrder = 1
        OnClick = BtBuscarClick
      end
    end
    object cxLabel1: TcxLabel
      Left = 348
      Top = 3
      Caption = '*todas as informa'#231#245'es s'#227'o obrigat'#243'rias.'
      ParentColor = False
      ParentFont = False
      Style.Color = clBtnFace
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clRed
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
    end
  end
  object PBottom: TPanel
    Left = 0
    Top = 376
    Width = 592
    Height = 39
    Align = alBottom
    TabOrder = 1
    object BtSalvar: TcxButton
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 75
      Height = 31
      Align = alLeft
      Caption = '&Salvar'
      OptionsImage.Glyph.SourceDPI = 96
      OptionsImage.Glyph.Data = {
        89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
        610000000B744558745469746C6500536176653BF9E8F9090000020349444154
        785E7D52316B145110FEDEE6EE9A03EF2E57284A6C6DAC42C0262185829D0A36
        16820AFE010BADC47F60AB2022585A588875B01041822158D858081204956872
        DC5DD6DD3733CF99D93DD713CCC0F7BEF776E7FB66E6ED0654912982633EFCFC
        9F67A2603B2CAC9DBFB2810CEB4B274EE1E4D271B0303832A24450A94C113112
        2846ECED8F301A7DB59CD76F379E9F6D9901425A5F3DB38C4F9FC7B87BE70690
        60E1E49C80BC886049B87EF33656964F6373EBFD1A8096190466017352B0ABA6
        BF22C4D5C9C5972E5CD632010F1F3F0553C4CECE17088B8F9ED99292B898884C
        EFE2548B270711D942867E7F114717BB9E0308582A83962D2C6EE0EE2925EFA6
        245671899205ED561B9D4EA77EC7CA6D887063904CCCE29735C923BEEF4F91C4
        A771DC7FF008C7865DEF88896B23FA6310BC03226FEFEAB55B9A203E63823143
        5490445C3883D05F23F8FCC228F26F180C06B3CB730059BD57866F20229EDF18
        D42358BC78F60487C5EAB98B5A6408E63903B1F6BD358B9FE302F06D729610BC
        B2AE20B63CF9D780602072579FB9F98B6082E6DF8D044932FF156CA648EC89F7
        5E7E844802299851B3C26667F30BCAF31D043B3091DFC3917E0F5C895C1C4D3C
        03E095C79303A4CA20984111CBFCDDE6D6F6CA70D0C39B571F2A7164AF129589
        14C65E59B0FB631765596C03C8030033E929BA8A0C4D8443F6A2982AF67E037E
        F6AC9379188DF20000000049454E44AE426082}
      TabOrder = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = BtSalvarClick
    end
    object BtFechar: TcxButton
      AlignWithMargins = True
      Left = 513
      Top = 4
      Width = 75
      Height = 31
      Align = alRight
      Caption = '&Fechar'
      OptionsImage.Glyph.SourceDPI = 96
      OptionsImage.Glyph.Data = {
        89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
        6100000023744558745469746C650043616E63656C3B53746F703B457869743B
        426172733B526962626F6E3B4C9696B20000038849444154785E1D906B4C5367
        18C7FF3DBD40CB1A2E32B55C9D598B4CA675D8D13836652E9B0359B67D589665
        3259E644A52571644474CB4CB6ECC23770C4449DD38D2885005E4683AB69C616
        8DA12384264EC8AAAC0C9149A1175ACEE9E939CFDE9EE7E477F2CBFFB924E720
        E6E943CC3B8895D12B00A0FEE3D08167A75A5BBAEEB71D9D081E6B4DA549FBDD
        A3CEEFDD1F3658016818AA98A71FD1915E202DE980A19D741E3EF6E0F8A7FC7F
        673B6979E002C5BC43B4C2581EB8480BE7BA68E6441BEF3B72F03300990C8E1D
        5016554E7B55D6C1ED9543C6C2B5BB739FDF025988838424E4240F10A0D2EAA0
        D26540AD37203CFE17C2C187A3EDBFDE7CF3DAD4748403A06EA8A8E830AC5FB3
        3B7BAB1901B717AE23DFE1CEC5EBEC90A0E0EB71A3CFD981C0B017C6F252180B
        D6BD74BCFA856E003A0CBDFD966DF250532AD4FF038DB734D18557DF21CFB08F
        2E37B5D370ED5E72D7D52BEEF9654CE9F91C1FD392EB0C4D3A0E4BE7F6ECD909
        CFDEFAD381AF4ED0A3D35FD399E272BA3F3D478F971234FD2044BDCE930AF798
        CF2FAED0DF5373CACCFCA92F2970B29DDCAFD7F56B48945E918201C41738945A
        2D581C7461ADA3192AB50AD64F9A010272730CC8D4AA313BE44289D58CF85D3F
        2411504BB28D93845489145E041F9CC1863C09A11BD7E1EFEA86240339463DB2
        B3F59025C0DFD98DD0C83594E6886C360831F408523265D208BC0021B20A35A7
        82B8BC0429C2239A10D812417988007088B14C8A8421EA75A094044A8A48F200
        17E78587629220B370E69F2884EA3750F07E23245946868E43A64EA3B8695F23
        F8EA7A046763EC780AC9640AF155FEB1269AE0BD91AC8CFDF910108E26F15A5B
        33788D1E860CF6CDE7CF225D45FB3F02A0C7CE36076E5CBD84825C3562A20E4B
        097E0CAD051B5FFCA97C9BE4ABAEA05B2FDBE9E6BE0F880F8568FCDB0E1AA9AA
        646C579C654AEF564D15FDB96333FDBCC94A8E751B6A0140DF5168B9E42A7B86
        266AB6D2ED1A1BF559CAC853B58DFCB576F2D7D9D3AE64B777D96862D716EA2F
        2BA76F4CE62B008C1A00C2F9C57F9D8DA2C99212C5E72C85323699F320A77FD2
        72040021DF9885F56BF2204457706F9EC74C4CF2F744169A012430DBF21E00A8
        2B754F98BEC82EEEED7AF2291A306FA451EBD3346633938FF13BF341969D62BD
        CF738AAF6ED6EA4B006882CE77A14ABFD255D2799903606830E4EF28E274070C
        1C67D74255041044C25C9CE43B4149F8B16735F41B8038DB9300E07F6924ECFB
        01D589CC0000000049454E44AE426082}
      TabOrder = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = BtFecharClick
    end
    object BtLimpar: TcxButton
      AlignWithMargins = True
      Left = 85
      Top = 4
      Width = 75
      Height = 31
      Align = alLeft
      Caption = '&Limpar'
      OptionsImage.Glyph.SourceDPI = 96
      OptionsImage.Glyph.Data = {
        89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
        610000001974455874536F6674776172650041646F626520496D616765526561
        647971C9653C0000000C744558745469746C650054726173683B649A356D0000
        024249444154785E75924F6BD44018C69FD9CC36E976975D28A52DDA562DB1C5
        2FE021C52FE04128C52A28BD7810912E5814113D78F0E4A907BD0852C4434FF5
        50B4071145DB83081E2C45BBBBAD8AF51F8B6CDBD5CD6EE69F99A181B0A40F09
        79923CEFF07BDF19AA94429BC8D9A96B6FFA7ABB3DC7B10128B45A0C3F7E5657
        E61FDD1D439B28122484F06AB5DDD9B907776E025053176EDC9652CE2041D475
        5D63CAE532C6CF14970921DED0E14184CFE2E973578A1A7060E8204252FD5FE3
        AE2CCCCF8EE9BA38013935397DFFD8E8B037E21E427F5F0F0AF91CD21D142CE0
        A8FFFD87ED9D3A46DD419437BE7961F61E80CB9A8EEA62002925E5C542EF01EC
        0629A4EB01489AC39104CD264775BB893FB526FC264177FF004AA5CD4B00A601
        C888C0924262F9C54B8D0E4A2DA42905491128A9C03807E7C2B4111BBA151118
        ADAF3ECF1F3F31BE3331711241AB85ADEFBF313A321C12F82855BEE2A87B04BE
        DFC0D2D22BBC7DBD5068DF05012050522293C982520A100BD95C0E969582440A
        99AE2C0801A410D0598D1F23302F4C2A820EDB41486E2663DBB62E306D394E67
        E83974265A2022507BDB2826CFCF98FE95A4900A86C40A6F2194FEAE7D442012
        0F92101C003197E01ACA583D40E3A24C5C541FA04882F3A8084CA3EF2DC6431F
        CF542A15E3955271021D94918D500D03E73C2193D402E7D50FAB6B3D9D8E6D82
        1B9B9FC1183733F8F8691D8D860FC1D9D6BE0B1025E79E3E59BCDA95CDA090CF
        E3D7970A1817085A0C6BEFDF210818A8957EBC2FC1B3C587D701DC8A9D0D2BC1
        33C4F41F3E8F1596C01C0CF00000000049454E44AE426082}
      TabOrder = 1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = BtLimparClick
    end
  end
  object XMLDocument1: TXMLDocument
    Left = 504
    Top = 299
  end
end
