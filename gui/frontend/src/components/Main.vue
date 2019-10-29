<template>
   <v-container fluid grid-list-md >
      <v-layout
        wrap
        align-end
      >
      <v-flex xs6>
        <v-card light >
            <v-card-title>
                Concept Constructors
            </v-card-title>
          <v-card-text >
              <v-container fluid>
                <v-switch v-model="conceptFeatures" color="indigo" label="functionality" value="functionality"></v-switch>
                <v-switch v-model="conceptFeatures" color="indigo" label="unqualified number restriction" value="unqualified_number_restriction"></v-switch>
                <v-switch v-model="conceptFeatures" color="indigo" label="qualified number restriction" value="qualified_number_restriction"></v-switch>
                <v-switch v-model="conceptFeatures" color="indigo" label="nominals" value="nominals"></v-switch>
                <v-switch v-model="conceptFeatures" color="indigo" label="least fixpoint operator" value="least_fix_point_op"></v-switch>
              </v-container>
          </v-card-text>
        </v-card>
      </v-flex>
      <v-flex xs6>
          <v-layout column wrap>
      <v-flex xs6>
        <v-card light >
            <v-card-title>
                Role Constructors
            </v-card-title>
          <v-card-text >
              <v-container fluid>
                <v-switch v-model="roleFeatures" color="indigo" label="inverse roles" value="inverse_roles"></v-switch>
              </v-container>
          </v-card-text>
        </v-card>

      </v-flex>
      <v-flex xs6>
        <v-card light >
            <v-card-title>
                TBox type
            </v-card-title>
          <v-card-text >
              <v-container >
                <v-radio-group v-model="tboxType" :mandatory="true"> 
                    <v-radio  color="indigo" label="empty TBox" value="empty_t_box"></v-radio>
                    <v-radio  color="indigo" label="acyclic TBox" value="acyclic_t_box"></v-radio>
                    <v-radio  color="indigo" label="general TBox" value="general_t_box"></v-radio>
                </v-radio-group>
        </v-container>
          </v-card-text>
        </v-card>
      </v-flex>
          </v-layout>
      </v-flex>
      <v-flex xs12>
        <v-card light >
            <v-card-title>
                Selected description logic:
                {{dl[0]}}
                <!-- {{inputs}} -->
                <!-- {{outputs}} -->
            </v-card-title>
        </v-card>
      </v-flex>
      <v-flex xs6>
        <v-card dark >
            <v-card-title>
                Complexity of Reasoning
                <v-switch v-model="finiteReasoning" color="indigo" style="margin-left:auto"
                 label="finite model reasoning"></v-switch>
            </v-card-title>
          <v-card-text >
              <v-container fluid>
                   <v-simple-table dark>

        <thead>
            <tr>
              <th></th>
                <th> Data Complexity</th>
                <th>
                </th>
                <th>
                    Combined Complexity
                </th>
                <th></th>
            </tr>
        </thead>
        <thead>
            <tr>
              <th></th>
                <th>
                    lower bound
                </th>
                <th>
                    upper bound
                </th>
                <th>
                    lower bound
                </th>
                <th>
                    upper bound
                </th>
            </tr>
        </thead>
    <tbody>
      <tr>
        <td>Concpet satisfiability</td>
        <td>{{cs_lb_d[0]}}</td>
        <td>{{cs_ub_d[0]}}</td>
        <td v-bind:class="{green: cs_lb[1]}">
          <v-badge  >
            <template v-if="cs_lb[1] > 0" v-slot:badge >{{cs_lb[1]}}</template> 
            {{cs_lb[0]}} 
          </v-badge>
    <v-tooltip bottom v-if="cs_lb[2]">
      <template v-slot:activator="{ on }">
        <v-icon color="primary" dark v-on="on">&darr;&darr;</v-icon>
      </template>
      <span>{{cs_lb[2]}}</span>
    </v-tooltip>
        </td>
        <td v-bind:class="{green: cs_ub[1]}">
          
          <v-badge  >
            <template v-if="cs_ub[1] > 0" v-slot:badge >{{cs_ub[1]}}</template> 
            {{cs_ub[0]}} 
          </v-badge>
    <v-tooltip bottom v-if="cs_ub[2]">
      <template v-slot:activator="{ on }">
        <v-icon color="primary" dark v-on="on">&uarr;&uarr;</v-icon>
      </template>
      <span>{{cs_ub[2]}}</span>
    </v-tooltip>
          </td>
      </tr>
      <tr>
        <td>ABox consistency</td>
        <td>{{ac_lb_d[0]}}</td>
        <td>{{ac_ub_d[0]}}</td>
        <td v-bind:class="{green: ac_lb[1]}">

          <v-badge  >
            <template v-if="ac_lb[1] > 0" v-slot:badge >{{ac_lb[1]}}</template> 
            {{ac_lb[0]}} 
          </v-badge>

    <v-tooltip bottom v-if="ac_lb[2]">
      <template v-slot:activator="{ on }">
        <v-icon color="primary" dark v-on="on">&darr;&darr;</v-icon>
      </template>
      <span>{{ac_lb[2]}}</span>
    </v-tooltip>
        </td>
        <td v-bind:class="{green: ac_ub[1]}">
          <v-badge  >
            <template v-if="ac_ub[1] > 0" v-slot:badge >{{ac_ub[1]}}</template> 
            {{ac_ub[0]}} 
          </v-badge>

    <v-tooltip bottom v-if="ac_ub[2]">
      <template v-slot:activator="{ on }">
        <v-icon color="primary" dark v-on="on">&uarr;&uarr;</v-icon>
      </template>
      <span>{{ac_ub[2]}}</span>
    </v-tooltip>
        </td>
      </tr>
      <tr>
        <td>Conjunctive query answering</td>
        <td>{{cq_lb_d[0]}}</td>
        <td>{{cq_ub_d[0]}}</td>
        <td>{{cq_lb[0]}}</td>
        <td>{{cq_ub[0]}}</td>
      </tr>
    </tbody>
  </v-simple-table>
        </v-container>
          </v-card-text>
        </v-card>
      </v-flex>
      <v-flex xs6>
        <v-card dark >
            <v-card-title>
                Model properties
            </v-card-title>
          <v-card-text >
              <v-container >
                   <v-simple-table dark>

        <thead>
            <tr>
                <th>
                    Model property
                </th>
                <th>
                    
                </th>
            </tr>
        </thead>
    <tbody>
      <tr>
        <td>Finite model</td>
        <td>{{fmp}}</td>
      </tr>
      <tr>
        <td>Tree model</td>
        <td>{{tmp}}</td>
      </tr>
    </tbody>
  </v-simple-table>
        </v-container>
          </v-card-text>
        </v-card>
      </v-flex>
      </v-layout> 
   </v-container> 
</template>

<script>
import axios from 'axios';
// outside of the component:
var initial = {
        conceptFeatures: [],
        roleFeatures: [],
        tboxType: "empty_t_box",
        cs_lb: "?",
        cs_lb_d: "?",

        cs_ub: "?",
        cs_ub_d: "?",

        ac_lb: "?",
        ac_lb_d: "?",

        ac_ub: "?",
        ac_ub_d: "?",

        cq_lb: "?",
        cq_lb_d: "?",

        cq_ub: "?",
        cq_ub_d: "?",

        fmp: "?",
        tmp: "?",
        dl: "?",
        inputs: "",
        outputs: "",
        finiteReasoning: false
    };
export default {
    data: () => (initial),
    methods: {
      reset(){
        this.cs_lb= "?"
        this.cs_lb_d= "?"

        this.cs_ub= "?"
        this.cs_ub_d= "?"

        this.ac_lb= "?"
        this.ac_lb_d= "?"

        this.ac_ub= "?"
        this.ac_ub_d= "?"

        this.cq_lb= "?"
        this.cq_lb_d= "?"

        this.cq_ub= "?"
        this.cq_ub_d= "?"

        this.fmp= "?"
        this.tmp= "?"
      },

        format(d){
          if(!d) return
          if (d instanceof Array) {
            d[0] = d[0].toUpperCase()
            d[2] = d[2].map(x => x.toUpperCase())
            return d
          }
          return [d.toUpperCase()]
        },
        onChange() {
          if (this.watchStop){
            return;
          }
            var inputs = {
                conceptFeatures: this.conceptFeatures,
                roleFeatures: this.roleFeatures,
                tboxType: this.tboxType,
                finiteReasoning: this.finiteReasoning
            }
            this.inputs = inputs;
            this.watchStop = true
            this.reset()
            axios.post("http://localhost:5000/post", inputs)
                .then((response) => {
                  this.outputs = response.data
                  var data = response.data
                  this.cs_lb = this.format(data.cs_lb)
                  this.cs_lb_d = this.format(data.cs_lb_d) || "?"

                  this.cs_ub = this.format(data.cs_ub)
                  this.cs_ub_d = this.format(data.cs_ub_d) || "?"
                  
                  this.ac_lb = this.format(data.ac_lb)
                  this.ac_lb_d = this.format(data.ac_lb_d) || "?"

                  this.ac_ub = this.format(data.ac_ub)
                  this.ac_ub_d = this.format(data.ac_ub_d) || "?"
                  this.dl = this.format(data.target_dl)
                  this.fmp = data["fin_model"]? "YES": data["-fin_model"]? "NO":"?"
                  this.tmp = data["tree_model"]? "YES": data["-tree_model"]? "NO":"?"

                  this.cq_lb = this.format(data.cq_lb) || "?"
                  this.cq_lb_d = this.format(data.cq_lb_d) || "?"

                  this.cq_ub = this.format(data.cq_ub) || "?"
                  this.cq_ub_d = this.format(data.cq_ub_d) || "?"

                  this.fmr_lb = this.format(data.fmr_lb) || "?"
                  this.fmr_lb_d = this.format(data.fmr_lb_d) || "?"

                  this.fmr_ub = this.format(data.fmr_ub) || "?"
                  this.fmr_ub_d = this.format(data.fmr_ub_d) || "?"
                  this.watchStop = false
                }).catch((err) => {
                  this.watchStop = false
                  this.outputs = err
                });
        }
    },
    created(){
      this.onChange();
    },
    watch: {
        conceptFeatures: function(){this.onChange()},
        roleFeatures: function(){this.onChange()},
        tboxType: function(){this.onChange()},
        finiteReasoning: function(){this.onChange()}
    }
}
</script>
