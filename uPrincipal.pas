unit uPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, ValEdit , uProdutoModel,
  jpeg;

type
  TFPrincipal = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ValueListEditor1: TValueListEditor;
    Edit1: TEdit;
    Panel1: TPanel;
    Panel2: TPanel;
    Button1: TButton;
    Image1: TImage;
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    procedure limparDados();
  end;

var
  FPrincipal: TFPrincipal;
  produtoModel : TFProdutoModel;
  valorVenda : Currency;
  valorDeDesconto : Currency;
  contador : integer;

implementation

uses uProdutoManager;

{$R *.dfm}

procedure TFPrincipal.BitBtn1Click(Sender: TObject);
begin
    FCadastroProduto.show()
end;

procedure TFPrincipal.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if ((key in ['0'..'9'] = false ) and (word(key) <> vk_back) ) then
      key := #0;
end;

procedure TFPrincipal.BitBtn2Click(Sender: TObject);
begin
  if( Edit1.Text <> '' ) then
  begin

    contador := contador + 1;

   try

     produtoModel := FCadastroProduto.findProdutoById( StrToInt( Edit1.Text ) );

     if( produtoModel.GetValorLiquido > 0 ) then
     begin
      valorVenda := valorVenda + produtoModel.ValorLiquidoProduto;
      valorDeDesconto := valorDeDesconto + produtoModel.DescontoProduto;

      Panel1.Caption := 'VALOR LIQUIDO:' + CurrToStr( valorVenda );
      Panel2.Caption := 'DESCONTO:' + CurrToStr( valorDeDesconto );

      ValueListEditor1.InsertRow( IntToStr(contador),produtoModel.NomeProduto, true );
      Edit1.Text := '';

    end
   except
      ShowMessage('Erro Item Informado Nao Encontrado');
   end;
  end
end;

procedure TFPrincipal.Button1Click(Sender: TObject);
var keyReturn : String;
begin
  if( ValueListEditor1.RowCount >= 1 ) then
  begin
     keyReturn := ValueListEditor1.Keys[1];
      if( keyReturn = '1' ) then
      begin
       begin
        case application.MessageBox( 'Deseja Finalizar A Venda' , 'Confirmação', MB_yesno + MB_iconInformation) of
          mrYes: limparDados();
        end;
       end;
      end
  end

end;

procedure TFPrincipal.limparDados;
begin
  ValueListEditor1.Strings.Clear;
  valorVenda := 0.00;
  valorDeDesconto := 0.00;
  contador := 0;

  Panel1.Caption := 'VALOR LIQUIDO:';
  Panel2.Caption := 'DESCONTO:';


end;

end.
