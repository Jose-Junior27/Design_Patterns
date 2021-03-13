unit ConcreteClass;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type

  { TCarro }

  TCarro = class
    procedure AtivarInjecaoEletronica; virtual; abstract;
    procedure AtivarBobinaIgnicao; virtual; abstract;
    procedure Ligar();
  end;

  { THonda }

  THonda = Class(TCarro)
  public
    procedure AtivarInjecaoEletronica; override;
    procedure AtivarBobinaIgnicao; override;
  end;

implementation

{ TCarro }

procedure TCarro.Ligar();
begin
  AtivarInjecaoEletronica;
  AtivarBobinaIgnicao;
end;

{ THonda }

procedure THonda.AtivarInjecaoEletronica;
begin
   WriteLn('Ativando Injecao Eletronica');
end;

procedure THonda.AtivarBobinaIgnicao;
begin
  WriteLn('Ativando Bobina Ignicao');
end;

end.

