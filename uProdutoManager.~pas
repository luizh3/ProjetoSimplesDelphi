unit uProdutoManager;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, ExtCtrls , uProdutoModel;

type
  TFCadastroProduto = class(TForm)
    lblNomeProduto: TLabeledEdit;
    lblDescricao: TLabeledEdit;
    lblValor: TLabeledEdit;
    lblDesconto: TLabeledEdit;
    cbTpProduto: TComboBox;
    gridProdutos: TStringGrid;
    BitBtn1: TBitBtn;
    Panel1: TPanel;
    BitBtn2: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure lblDescontoKeyPress(Sender: TObject; var Key: Char);
    procedure lblValorKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  published
    procedure configInicializacaoForm();
    procedure insertProdutoGrid( produto : TFProdutoModel );

    function findProdutoById( idProduto : integer ) : TFProdutoModel;

  end;

var
  FCadastroProduto: TFCadastroProduto;
  produtoModel : TFProdutoModel;

implementation

{$R *.dfm}

procedure TFCadastroProduto.configInicializacaoForm;
begin

  gridProdutos.Cells[0,0] := 'ID Produto';
  gridProdutos.Cells[1,0] := 'Nome Produto';
  gridProdutos.Cells[2,0] := 'Descricao';
  gridProdutos.Cells[3,0] := 'Valor';
  gridProdutos.Cells[4,0] := 'Desconto';
  gridProdutos.Cells[5,0] := 'Valor Liquido';
  gridProdutos.Cells[6,0] := 'Tipo Produto';

  try
    cbTpProduto.Items.Clear;
    cbTpProduto.Items.Append( 'UN' );
    cbTpProduto.Items.Append( 'KG' );
  finally
    cbTpProduto.Items.EndUpdate;
  end;

end;

procedure TFCadastroProduto.FormCreate(Sender: TObject);
begin
    configInicializacaoForm();
end;

procedure TFCadastroProduto.BitBtn1Click(Sender: TObject);
begin
     produtoModel := TFProdutoModel.Create();

     produtoModel.NomeProduto := lblNomeProduto.Text;

     produtoModel.DescricaoProduto := lblDescricao.Text;

     if( lblValor.Text <> '' ) then
     begin
     produtoModel.ValorProduto := StrToCurr( lblValor.Text );
     end
     else
      Application.MessageBox('Coloque um Valor No item','Item Sem Preco',MB_ICONEXCLAMATION  + MB_OK + MB_SYSTEMMODAL);

     if( lblDesconto.Text <> '' ) then
     begin
      produtoModel.DescontoProduto := StrToCurr( lblDesconto.Text );
     end
     else
      produtoModel.DescontoProduto := 0.00;

     produtoModel.TpProduto := cbTpProduto.Items.Strings[cbTpProduto.ItemIndex];

     insertProdutoGrid( produtoModel );
end;

procedure TFCadastroProduto.insertProdutoGrid(produto: TFProdutoModel);
var indexRowGridProduto : integer;
begin
    indexRowGridProduto := 0;

    if( produto.DescontoProduto < produto.ValorProduto ) then
    begin
     indexRowGridProduto := gridProdutos.RowCount + 1;
     gridProdutos.RowCount := indexRowGridProduto;

     indexRowGridProduto := indexRowGridProduto - 1;

     gridProdutos.Cells[0,indexRowGridProduto] := IntToStr( indexRowGridProduto );
     gridProdutos.Cells[1,indexRowGridProduto] := produto.NomeProduto;
     gridProdutos.Cells[2,indexRowGridProduto] := produto.DescricaoProduto;
     gridProdutos.Cells[3,indexRowGridProduto] := CurrToStr( produto.ValorProduto );
     gridProdutos.Cells[4,indexRowGridProduto] := CurrToStr( produto.DescontoProduto );
     gridProdutos.Cells[5,indexRowGridProduto] := CurrToStr( produto.ValorLiquidoProduto );

     if( produto.TpProduto = '' ) then
     begin
      gridProdutos.Cells[6,indexRowGridProduto] := 'UN'
     end
     else
      gridProdutos.Cells[6,indexRowGridProduto] := cbTpProduto.Items.Strings[cbTpProduto.ItemIndex];
    end
    else
     Application.MessageBox('Valor Desconto Maior ou igual ao Valor Produto','Desconto',MB_ICONEXCLAMATION  + MB_OK + MB_SYSTEMMODAL);
end;

procedure TFCadastroProduto.lblDescontoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if ((key in ['0'..'9'] = false) and (word(key) <> vk_back)) then
      key := #0;
end;

procedure TFCadastroProduto.lblValorKeyPress(Sender: TObject;
  var Key: Char);
begin
  if ( ( key in ['0'..'9'] = false ) and (word(key) <> vk_back ) ) then
      key := #0;
end;

procedure TFCadastroProduto.BitBtn2Click(Sender: TObject);
begin
  close;
end;

function TFCadastroProduto.findProdutoById(
  idProduto: integer ): TFProdutoModel;
  var produtoModelLocal : TFProdutoModel;
begin

     produtoModelLocal := TFProdutoModel.Create;

     if( ( gridProdutos.RowCount >= idProduto ) and ( gridProdutos.RowCount <> 1 ) ) then
     begin
     
      produtoModelLocal.NomeProduto := gridProdutos.Cells[ 1 , idProduto ];
      produtoModelLocal.DescricaoProduto := gridProdutos.Cells[2,idProduto];
      produtoModelLocal.ValorProduto := StrToCurr( gridProdutos.Cells[3,idProduto] );
      produtoModelLocal.DescontoProduto := StrToCurr( gridProdutos.Cells[4,idProduto] );
      produtoModelLocal.ValorLiquidoProduto := StrToCurr( gridProdutos.Cells[5,idProduto] );
      produtoModelLocal.TpProduto := gridProdutos.Cells[6,idProduto];

     end
     else
      begin
       case application.MessageBox('Produto Nao Encontrado , Deseja Cadastrar o Produto ?', 'Confirmação', MB_yesno + MB_iconInformation) of
        //mrNo, mrCancel: ;
        mrYes: FCadastroProduto.show();
       end;
      end;

     Result := produtoModelLocal;
end;

end.
