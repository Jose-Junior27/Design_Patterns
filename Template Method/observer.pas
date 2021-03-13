unit observer;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type
  ISujeito = interface;

  IObserver = interface
    procedure Update(ASujeito: ISujeito);
  end;

  ISujeito = interface
    procedure Subscribe(AObserver: IObserver);
    procedure UnSubscribe(AObserver: IObserver);
    procedure Notify;
  end;

  { TMontadora }

  TMontadora = class(TInterfacedObject, ISujeito)
  private
    FObservers: TInterfaceList;
  public
    constructor Create;

    procedure MudarModeloMontagem;
    procedure Subscribe(AObserver: IObserver);
    procedure UnSubscribe(AObserver: IObserver);
    procedure Notify;

  end;

  { TCarro }

  TCarro = class(TInterfacedObject, IObserver)
  private
    FModelo: String;
  public
    procedure Update(ASujeito: ISujeito);
    constructor Create(Modelo: String);
    procedure EnviaNotificacao(const Value: String);
  end;

implementation

{ TMontadora }

constructor TMontadora.Create;
begin
  inherited;
  FObservers := TInterfaceList.Create;
end;

procedure TMontadora.MudarModeloMontagem;
begin
  //Implementa mudança;
  Notify;
end;

procedure TMontadora.Subscribe(AObserver: IObserver);
begin
  FObservers.Add(AObserver);
end;

procedure TMontadora.UnSubscribe(AObserver: IObserver);
begin
  FObservers.Remove(AObserver);
end;

procedure TMontadora.Notify;
var
  i: byte;
begin
  for i:= 0 to Pred( FObservers.Count ) do
    (IObserver(FObservers.Items[i])).Update(Self);
end;

{ TCarro }

procedure TCarro.Update(ASujeito: ISujeito);
var
  Model: String;
begin
  inherited;
  Model:= FModelo;
  //EnviaNotificacao(Model + ' notificado');
end;

constructor TCarro.Create(Modelo: String);
begin
  FModelo:= Modelo;
end;

procedure TCarro.EnviaNotificacao(const Value: String);
begin
  exit;
  //WriteLn(Value);
end;

end.

