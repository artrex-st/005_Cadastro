unit ufrmCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,uClasses, Vcl.Mask,
  Vcl.ComCtrls, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    edtNome: TEdit;
    edtSnome: TEdit;
    cbCad: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    btnAdd: TButton;
    meCpf: TMaskEdit;
    dtpData: TDateTimePicker;
    btnEdit: TButton;
    btnExcluir: TButton;
    Panel1: TPanel;
    btnKill: TButton;
    procedure btnAddClick(Sender: TObject);
    procedure cbCadChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnEditClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnKillClick(Sender: TObject);
    procedure meCpfKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public

    { Public declarations }
  end;

var
  Form1: TForm1;
implementation
{$R *.dfm}


procedure TForm1.btnAddClick(Sender: TObject);    //// BTN ADD ########
var
objPessoa:Tcadastro;
  begin
    if edtNome.Text='' then
      begin
        ShowMessage('Digite um Nome valido.');
        edtNome.SetFocus;
      end
      else
      if edtSnome.Text='' then
        begin
          ShowMessage('Digite um Sobre Nome valido.');
          edtSnome.SetFocus;
        end
        else
        if meCpf.GetTextLen<11 then
          begin
            ShowMessage('Digite um CPF valido.');
            meCpf.SetFocus;
          end
            else
              if meCpf.GetTextLen<11 then
                begin
                  ShowMessage('Digite um CPD valido.');
                  meCpf.SetFocus;
                end
          else
            begin
              objPessoa:= Tcadastro.Create;  //INSTANCIA O OBEJTO DIREITO
              // recebendo edits
              objPessoa.nome := edtNome.Text;
              objPessoa.snome := edtSnome.Text;
              objPessoa.cpf := meCpf.Text;

              objPessoa.data := dtpData.DateTime;
              //adicionando e vinculando objeto ao index do Combobox
              cbCad.Items.AddObject(objPessoa.nome, TObject(objPessoa));
              //limpando edts
              edtNome.Clear;
              edtSnome.Clear;
              meCpf.Clear;
              edtNome.SetFocus;
              btnExcluir.Enabled:=true;
              btnEdit.Enabled:=true;
              btnKill.Enabled:=true;
              edtNome.SetFocus;
            end;
  end;
procedure TForm1.btnEditClick(Sender: TObject);    //// BTN EDIT ######
var
cadastro:Tcadastro;
  begin
    if cbCad.ItemIndex=-1 then
      begin
        ShowMessage('Selecione ao menos 1 item.');
        cbCad.SetFocus;
      end
        else if edtNome.Text='' then
          begin
            ShowMessage('Digite um Nome valido.');
            edtNome.SetFocus;
          end
          else
          if edtSnome.Text='' then
            begin
              ShowMessage('Digite um Sobre Nome valido.');
              edtSnome.SetFocus;
            end
            else
            if meCpf.GetTextLen<11 then
              begin
                ShowMessage('Digite um CPD valido.');
                meCpf.SetFocus;
              end
              else
                begin
                  cadastro:=Tcadastro(cbCad.Items.Objects[cbCad.ItemIndex]); //INSTANCIA O OBEJTO DIREITO
                  // recebendo edits
                  cadastro.nome := edtNome.Text;
                  cadastro.snome := edtSnome.Text;
                  cadastro.cpf := meCpf.Text;
                  cadastro.data := dtpData.DateTime;
                  //adicionando e vinculando objeto ao index do Combobox
                  cbCad.Items.AddObject(cadastro.nome, TObject(cadastro));
                  cbCad.Items.Delete(cbCad.ItemIndex);
                  //limpando edts
                  edtNome.Clear;
                  edtSnome.Clear;
                  meCpf.Clear;
                  edtNome.SetFocus;
                  ShowMessage('Item editado com sucesso!');
                  cbCad.SetFocus;
                end;
end;

procedure TForm1.btnExcluirClick(Sender: TObject);  //BTN EXCLUIR  ####
var
cadastro:Tcadastro;
confirma:integer;
  begin
    if cbCad.ItemIndex<>-1 then
      begin
        cadastro:=Tcadastro(cbCad.Items.Objects[cbCad.ItemIndex]); //INSTANCIA O OBEJTO DIREITO
        cbCad.Items.Objects[cbCad.ItemIndex].Free;     //libera memoria
        cbCad.Items.Delete(cbCad.ItemIndex);
        edtNome.Clear;
        edtSnome.Clear;
        meCpf.Clear;
        edtNome.SetFocus;
        ShowMessage('Item Excluido com sucesso!');
          if cbCad.ItemIndex=-1 then
            begin
              btnExcluir.Enabled:=false;
              btnEdit.Enabled:=false;
              btnKill.Enabled:=false;
              edtNome.SetFocus;
            end;
        cbCad.SetFocus;
      end
        else
          begin
            ShowMessage('Selecione ao menos 1 item.');
            cbCad.SetFocus;
          end;
  end;

procedure TForm1.btnKillClick(Sender: TObject);      // btn KILL ALL
var
cadastro:Tcadastro;
I,confirma: Integer;
begin
  cbCad.ItemIndex:=0;
  confirma := messagedlg('Deseja realmente deletar TODOS os cadastros?',mtWarning, mbOKCancel, 0);
  if (cbCad.Items.Count<>0) and (confirma=mrok) then //caso feche o programa sem inserir nada evita um access violation
    begin
      cadastro:=Tcadastro(cbCad.Items.Objects[cbCad.ItemIndex]);//atribuindo o objeto do index ao cadastro
      for I := 0 to cbCad.Items.Count-1 do    //cont at� o maximo dos items -1
      begin
        cbCad.Items.Objects[I].Free;     //libera memoria
      end;
      cbCad.Clear;
      edtNome.Clear;
      edtSnome.Clear;
      meCpf.Clear;
      edtNome.SetFocus;
      ShowMessage('Todos os itens Excluidos com sucesso!');
      edtNome.SetFocus;
      btnExcluir.Enabled:=false;
      btnEdit.Enabled:=false;
      btnKill.Enabled:=false;
      edtNome.SetFocus;
    end
      else
        begin
          ShowMessage('Exclus�o CANCELADA!');
          edtNome.SetFocus;
        end;


end;


procedure TForm1.cbCadChange(Sender: TObject); //evendo quando trocar o foco ####
var
cadastro:Tcadastro;
  begin
    //atribuindo o objeto do index ao cadastro
    cadastro:=Tcadastro(cbCad.Items.Objects[cbCad.ItemIndex]); //o ItemIndex puxa o foco atual do combobox
    //puxando cambos do cadastro
    edtNome.Text := cadastro.nome;
    edtSnome.Text := cadastro.snome;
    meCpf.Text := cadastro.cpf;
    dtpData.DateTime := cadastro.data;
  end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);  //efento quando fechar o form
  var
  cadastro:Tcadastro;
  I: Integer;
  begin
    cbCad.ItemIndex:=0;
    if cbCad.Items.Count<>0 then //caso feche o programa sem inserir nada evita um access violation
      begin
        cadastro:=Tcadastro(cbCad.Items.Objects[cbCad.ItemIndex]);//atribuindo o objeto do index ao cadastro
        for I := 0 to cbCad.Items.Count-1 do    //cont at� o maximo dos items -1
        begin
          cbCad.Items.Objects[I].Free;     //libera memoria
        end;
      end;
  end;
procedure TForm1.meCpfKeyPress(Sender: TObject; var Key: Char);
  begin
    if not (Key in['0'..'9']) then       //se a tecla digitada n�o estiver entre 0 e 9 n�o deixa digitar
      Key := '#';
  end;

end.

{
procedure TForm1.btnListaClick(Sender: TObject);
begin
      ShowMessage(tlbLista.Items.Strings[tlbLista.ItemIndex]);
end;

}
