require 'spec_helper'

describe ParticipationsController do
  describe "POST moip_callback" do
    let(:participation) { stub_model(Participation, :update_attribute => true) }
    before { Participation.stub("find_by_secret").with("1").and_return(participation) }

    it "should change the moip status" do
      participation.should_receive(:update_attribute).with(:moip_status, "4")
      post :moip_callback, :id_transacao => 1, :status_pagamento => 4
    end
    
    it "should change the moip id" do
      participation.should_receive(:update_attribute).with(:moip_id, "1")
      post :moip_callback, :id_transacao => 1, :cod_moip => 1
    end

    it "should respond with 200 status" do
      post :moip_callback, :id_transacao => 1
      response.status.should be_== 200
    end
  end
end
